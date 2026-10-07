#!/usr/bin/env bats

load helpers/common

setup() {
    mole_test_setup_home browser-clones
    export MOLE_TEST_MODE=1 MOLE_TEST_NO_AUTH=1
    source "$PROJECT_ROOT/lib/core/common.sh"
    CLONE_ROOT="$HOME/Library/Caches/clone-fixture/X"
    CLONE="$CLONE_ROOT/com.google.Chrome.code_sign_clone/code_sign_clone.A123bc"
    BUNDLE="$CLONE/Google Chrome.app"
    mkdir -p "$BUNDLE/Contents/MacOS"
    printf 'fixture executable' >"$BUNDLE/Contents/MacOS/Google Chrome"
    /usr/libexec/PlistBuddy -c 'Add :CFBundleIdentifier string com.google.Chrome' "$BUNDLE/Contents/Info.plist" >/dev/null
    /usr/libexec/PlistBuddy -c 'Add :CFBundleExecutable string Google Chrome' "$BUNDLE/Contents/Info.plist"
    # shellcheck disable=SC2329 # Called indirectly by the sourced cleanup implementation.
    _mole_browser_clone_root() { printf '%s\n' "$CLONE_ROOT"; }
    # No host browser, lsof, sudo, or deletion is used by these fixtures.
    # shellcheck disable=SC2329 # Called indirectly by the sourced cleanup implementation.
    run_with_timeout() {
        shift
        case "$1" in
        /bin/ps)
            printf '%s\n' "${PROCESS_TABLE:-/sbin/launchd}"
            return "${PROCESS_RC:-0}"
            ;;
        /usr/sbin/lsof)
            printf '%s' "${HANDLE_OUTPUT:-}"
            return "${HANDLE_RC:-1}"
            ;;
        *) "$@" ;;
        esac
    }
    # shellcheck disable=SC2329 # Called indirectly by the sourced cleanup implementation.
    system_cleanup_budget_reached() { return 1; }
    CALLS="$HOME/calls"
    : >"$CALLS"
    code_sign_cleaned=0
    # shellcheck disable=SC2329 # Called indirectly by the sourced cleanup implementation.
    safe_remove() {
        [[ "$2" == true && "$3" == unknown ]] || return 1
        [[ "$5" == "${1%/*}" && -n "$6" && -n "$7" ]] || return 1
        "$_MOLE_SAFE_REMOVE_FINAL_GUARD" "$1" || return 1
        printf '%s\n' "$1" >>"$CALLS"
        return "${REMOVE_RC:-0}"
    }
}

teardown() { mole_test_teardown_home; }

@test "browser clone cleanup offers individual reviewed children with unknown bytes" {
    clean_browser_code_sign_clones
    [ "$code_sign_cleaned" -eq 1 ]
    [ "$(cat "$CALLS")" = "$CLONE" ]
    [ -d "$CLONE" ]
}

@test "browser clone cleanup retains running browser helpers and unknown process probes" {
    for PROCESS_TABLE in '/sbin/launchd
/Applications/Google Chrome.app/Contents/MacOS/Google Chrome' '/sbin/launchd
Google Chrome Helper (Renderer)' '/sbin/launchd
/Applications/Chromium.app/Contents/MacOS/Chromium' 'permission denied'; do
        clean_browser_code_sign_clones
    done
    PROCESS_TABLE=/sbin/launchd PROCESS_RC=124 clean_browser_code_sign_clones
    [ ! -s "$CALLS" ]
    [ "$code_sign_cleaned" -eq 0 ]
}

@test "browser clone snapshot retains open handles and lsof failures" {
    for HANDLE_RC in 0 2 124; do
        run _mole_browser_clone_snapshot "$CLONE"
        [ "$status" -ne 0 ]
    done
    HANDLE_RC=1 HANDLE_OUTPUT='warning: permission denied'
    run _mole_browser_clone_snapshot "$CLONE"
    [ "$status" -ne 0 ]
}

@test "browser clone snapshot refuses parent unknown vendor extra files and symlinks" {
    run _mole_browser_clone_snapshot "${CLONE%/*}"
    [ "$status" -ne 0 ]
    touch "$CLONE/personal.txt"
    run _mole_browser_clone_snapshot "$CLONE"
    [ "$status" -ne 0 ]
    /bin/rm "$CLONE/personal.txt" # SAFE: test-owned fixture
    mv "$BUNDLE" "$HOME/saved-bundle"
    ln -s "$HOME/saved-bundle" "$BUNDLE"
    run _mole_browser_clone_snapshot "$CLONE"
    [ "$status" -ne 0 ]
    run _mole_browser_clone_snapshot "$CLONE_ROOT/com.crowdstrike.falcon.code_sign_clone/code_sign_clone.A123bc"
    [ "$status" -ne 0 ]
}

@test "browser clone snapshot validates identity and supports app.bundle layout" {
    mv "$BUNDLE" "$BUNDLE.bundle"
    BUNDLE="$BUNDLE.bundle"
    run _mole_browser_clone_snapshot "$CLONE"
    [ "$status" -eq 0 ]
    /usr/libexec/PlistBuddy -c 'Set :CFBundleIdentifier other' "$BUNDLE/Contents/Info.plist"
    run _mole_browser_clone_snapshot "$CLONE"
    [ "$status" -ne 0 ]
}

@test "browser starting at final removal guard retains the clone" {
    # shellcheck disable=SC2329 # Called indirectly by the sourced cleanup implementation.
    safe_remove() {
        PROCESS_TABLE='/sbin/launchd
Google Chrome Helper'
        "$_MOLE_SAFE_REMOVE_FINAL_GUARD" "$1" || return 1
        printf 'unexpected\n' >>"$CALLS"
    }
    clean_browser_code_sign_clones
    [ ! -s "$CALLS" ]
    [ "$code_sign_cleaned" -eq 0 ]
}

@test "replacing a reviewed clone at final removal guard retains it" {
    # shellcheck disable=SC2329 # Called indirectly by the sourced cleanup implementation.
    safe_remove() {
        mv "$CLONE" "$CLONE.replaced"
        mkdir -p "$CLONE"
        "$_MOLE_SAFE_REMOVE_FINAL_GUARD" "$1" || return 1
        printf 'unexpected\n' >>"$CALLS"
    }
    clean_browser_code_sign_clones
    [ ! -s "$CALLS" ]
    [ "$code_sign_cleaned" -eq 0 ]
}

@test "browser clone failed removal does not report cleaned" {
    REMOVE_RC=1 clean_browser_code_sign_clones
    [ "$code_sign_cleaned" -eq 0 ]
}
