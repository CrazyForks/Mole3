# Mole CLI queue review and execution plan

Snapshot date: 2026-10-03, Asia/Taipei.
Authorization updated: the maintainer approved execution, contributor-branch improvements, commit/push/merge, and per-item reply/closure after a delivered fix. Use Nightly for user testing; no stable tag or release is requested. Unresolved reports remain open with a concrete evidence request.

## Verified baseline

- Repository: `tw93/Mole`, branch `main`, HEAD and remote main both `c430bac637929ebede043df81d3bef319428309c`.
- Worktree was clean before this handoff file was created.
- Latest public CLI release: `V1.56.1`, published 2026-09-28.
- Initial and final PR IDs: 1667, 1671, 1672, 1673 (4).
- Initial and final issue IDs: 1453, 1554, 1631, 1650, 1651, 1659, 1660, 1661, 1662, 1665, 1666, 1668, 1669 (13).
- CLI issues: 1631, 1659, 1666, 1669 (4). Other issues explicitly concern the Mac app (9).
- Final queue refresh found no additions, removals, issue updates, or PR head changes.
- All four PRs have nine completed successful GitHub checks, are mergeable, and allow maintainer edits. This is remote CI evidence, not local test evidence.
- Review covered all PR diffs, issue bodies/comments, relevant production callers, and safety/timeout contracts. No full PR test suite was run in this review.

## PR dispositions

| PR | Decision | Scope and required work |
| --- | --- | --- |
| [1673](https://github.com/tw93/Mole/pull/1673) | Revise contributor branch, then merge | Keep the debug-only correction. Add durable batch-preview regressions for confirmed sibling (0), incomplete scan (3), and failed scan (2), proving unchanged bundle-only plan and no shared teardown. This does not resolve issue 1669. |
| [1671](https://github.com/tw93/Mole/pull/1671) | Merge as written after local verification | Filtering failure now returns its own status and discards partial output instead of repeating discovery with find. Caller excludes failed roots. No concrete blocking defect found. Do not expand into a scan rewrite or larger default timeout. |
| [1672](https://github.com/tw93/Mole/pull/1672) | Revise contributor branch, then merge | Keep bounded activity concurrency and existing deadlines. Fix incomplete result handling, test beyond the first batch, and verify cancellation with real bounded probes. Do not claim this alone completely resolves issue 1666. |
| [1667](https://github.com/tw93/Mole/pull/1667) | Narrow contributor branch, then merge | Keep size-unit coloring in real cleanup and summary; retain existing row text, icons, punctuation, counts, and preview formatting. Avoid a new whole-row renderer just for coloring. Verify unknown/partial sizes and NO_COLOR. |

Contributor branch targets, to be refreshed before any future write:

- 1673: `r266-tech:codex/uninstall-sibling-diagnostics`.
- 1671: `r266-tech:codex/purge-scan-budget`.
- 1672: `r266-tech:codex/purge-activity-window`.
- 1667: `HaraldNordgren:feat/clean-size-colors-real-run`.

### Concrete evidence for PR 1672

The proposed result reader resets only the state when `read` fails, then treats status `1` as `old`. A Bash 3.2 reproduction with a result file containing only `1` without a newline produced `status=1 state=old recent=false`. This can incorrectly preselect a candidate. The final deletion activity recheck still exists, so this is not evidence of a deletion-protection bypass.

Require a complete successful read, a valid status/state pair, and successful worker completion before accepting an old classification. Missing, truncated, malformed, failed, and timed-out records must stay uncertain. Add each case independently, with a positive old control. Add SAFE annotations to the two new scratch-file removals; the existing recursive-deletion audit does not check plain rm -f.

Fixed batches also wait for the slowest member before admitting the next batch. Measure more than four candidates with slow/fast mixing before choosing whether a sliding window is necessary. Keep bounded concurrency and overall budget either way. Cancellation now drains current bounded probes, so verify and report that visible timing change rather than promising immediate exit.

### Scope to remove from PR 1667

The patch intentionally changes more than capacity color: Service Worker preview wording/separators, dry suffixes on some previews, and Simulator capacity parentheses. Those are not deletion regressions, but are unnecessary to the coloring request. Preserve their previous text and change only the capacity ANSI formatting, keeping the success icon green. Do not remove functional protections or accounting.

## CLI issue dispositions

| Issue | Decision | Next step and closure condition |
| --- | --- | --- |
| [1669](https://github.com/tw93/Mole/issues/1669) | Keep open; diagnose | The unreadable-path warning means unknown sibling evidence, not a confirmed sibling. 1673 fixes the misleading debug reason only. Obtain bounded debug evidence at receipt, root enumeration, candidate verification, and deadline failure points. Identify why every app is affected before narrowing any probe scope. Preserve unknown-state retention and final identity/sibling checks. Close only after the actual failure is addressed and a usable delivery path is verified. |
| [1659](https://github.com/tw93/Mole/issues/1659) | Keep open; investigate tty7 | Reporter says --list exits 0, tty7 hangs and ignores Ctrl-C, built-in Terminal works. Observe Finalizing list, metadata-refresh launch, spinner stop/wait, scan return, fingerprint/load, input drain, and selector boundaries. Capture PID/process-group/wait state without app inventory. Reproduce on actual tty7; do not claim spinner is the cause yet. Add a failing regression for the confirmed path before fixing it. |
| [1666](https://github.com/tw93/Mole/issues/1666) | Keep open; accept bounded fix scope | 1671 fixes repeated discovery and misleading stage logs; 1672 improves activity throughput but needs result/cancellation fixes. The expensive authored-content filtering and large-tree end-to-end result remain separately unverified. Compare the same real tree and mode before/after. Do not remove protection walks, increase budgets blindly, add normal skipped counts, retry reminders, or tuning advice. Close only after verified scope is explicit and delivered; keep any remaining throughput problem separately recorded. |
| [1631](https://github.com/tw93/Mole/issues/1631) | Keep open for samples | Accepted threshold is at least 3 of the first 20 machine samples with a cache at least 1 GB. Public thread currently has the original large-cache report and one additional machine sample, insufficient to decide prevalence. Keep E5RT protection. Add only bounded read-only visibility if the threshold is met; close as not planned only after adequate sampling fails the agreed threshold. |

No CLI issue is ready for immediate closure. No PR should currently be rejected as not planned. A merged diagnostic PR alone does not establish that its related issue is fixed.

## Mac app queue, excluded from CLI implementation

These nine items are listed to reconcile the complete public queue, not as source-reviewed Mac findings or closure recommendations.

| Issue | Reported concern | Routing |
| --- | --- | --- |
| [1668](https://github.com/tw93/Mole/issues/1668) | Menu-bar metric spacing and excessive width | Mac UI review; keep open pending rendered geometry validation. |
| [1665](https://github.com/tw93/Mole/issues/1665) | Release notes for different update sources | Mac updater feature assessment; no CLI expansion. |
| [1662](https://github.com/tw93/Mole/issues/1662) | Default selection for deleting app data | Mac product/safety decision; current maintainer comment explicitly leaves the setting under consideration, do not silently close. |
| [1661](https://github.com/tw93/Mole/issues/1661) | Explain app identity/location | Mac installed-app information assessment; keep separate. |
| [1660](https://github.com/tw93/Mole/issues/1660) | Clipped fan RPM label | Mac rendered UI bug investigation, not CLI status. |
| [1651](https://github.com/tw93/Mole/issues/1651) | Xcode preview size differs from cleanup | Mac support investigation; private diagnostic requested, preserve authored/in-use data. |
| [1650](https://github.com/tw93/Mole/issues/1650) | Full analyze refresh leaves nested cached views stale | Mac cache invalidation investigation; do not infer CLI cache regression. |
| [1554](https://github.com/tw93/Mole/issues/1554) | Updates refresh misses Homebrew updates | Mac recurrence, reopened; reporter says private diagnostics sent. Retrieve those before another patch. |
| [1453](https://github.com/tw93/Mole/issues/1453) | Manual fan mode drops back | Mac recurrence, reopened after newer version report; current build/runtime evidence needed, no blind retuning. |

## Execution order after approval

1. Revise and validate PR 1673, then merge through the contributor PR. Leave 1669 open.
2. Diagnose 1669 at the actual failed probes, then deliver the narrow confirmed fix.
3. Reproduce 1659 in tty7 with minimum stage/process evidence, then fix the confirmed interactive path.
4. Validate and merge 1671, revise/validate/merge 1672, then measure 1666 end to end. Keep unresolved filtering cost explicit.
5. Narrow, render/compare, and validate 1667, then merge.
6. Continue 1631 sampling; decide using the existing threshold, not the maintainer's disk.
7. Review Mac items in the Mac repository as a separate authorized task.

For each implementation: refresh PR head, base, permission, contributor remote, local branch/worktree, and GitHub identity before writing. Preserve attribution, omit AI trailers on merge. Run targeted red/green regressions, project checks, full tests before commit/merge, and required Go/build checks when relevant. Investigate base failures rather than attributing contributor-reported failures to the PR without reproduction.

Before any issue reply/closure, verify the actual source-to-user delivery path. Stable V1.56.1, main, and Nightly are separate claims. Refresh initial/final queue IDs after every execution batch. Update this handoff as items are resolved; remove it when the handoff is no longer needed.
