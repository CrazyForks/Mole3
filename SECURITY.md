# Security Policy

Mole is a local system maintenance tool. It includes high-risk operations such as cleanup, uninstall, optimization, and artifact removal. We treat safety boundaries, deletion logic, and release integrity as security-sensitive areas.

## Reporting a Vulnerability

Please report suspected security issues privately.

- Email: `hitw93@gmail.com`
- Subject line: `Mole security report`

Do not open a public GitHub issue for an unpatched vulnerability.

If GitHub Security Advisories private reporting is enabled for the repository, you may use that channel instead of email.

Include as much of the following as possible:

- Mole version and install method
- macOS version
- Exact command or workflow involved
- Reproduction steps or proof of concept
- Whether the issue involves deletion boundaries, symlinks, sudo, path validation, or release/install integrity

## Response Expectations

- We aim to acknowledge new reports within 7 calendar days.
- We aim to provide a status update within 30 days if a fix or mitigation is not yet available.
- We will coordinate disclosure after a fix, mitigation, or clear user guidance is ready.

Response times are best-effort for a maintainer-led open source project, but security reports are prioritized over normal bug reports.

## Supported Versions

Security fixes are provided for:

- The latest stable release
- The current `main` branch

Older releases do not receive backported security patches. We recommend updating to the latest release to ensure you have current safety protections.

## What Qualifies as a Security Issue

Security-relevant issues include:

- Path validation bypasses
- Deletion outside intended cleanup boundaries
- Unsafe handling of symlinks or path traversal
- Unexpected privilege escalation or unsafe sudo behavior
- Removal of protected sensitive data (keychains, credentials, browser history)
- Release, installation, update, or checksum integrity issues
- Logic defects leading to unintended data loss

## What Usually Does Not Qualify

These are handled as regular issues or feature requests rather than security reports:

- Residual junk left behind (incomplete cleanup)
- False negatives where Mole conservatively skips a file
- Cosmetic or UI rendering glitches
- Requests for more aggressive deletion rules
- Compatibility quirks without security impact

When in doubt, report privately first.

For architecture details, safety layers, and known limitations, see [SECURITY_DESIGN.md](docs/SECURITY_DESIGN.md) and [SECURITY_AUDIT.md](SECURITY_AUDIT.md).
