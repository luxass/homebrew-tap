# homebrew-tap

Homebrew tap for luxass' projects.

## Install

```bash
brew tap luxass/homebrew-tap
```

## Available Formulas

| Formula                                       | Description                                                        |
| --------------------------------------------- | ------------------------------------------------------------------ |
| [actioneer](Formula/actioneer.rb)             | CLI tool for GitHub Actions workflows                              |
| [artifacthub-mcp](Formula/artifacthub-mcp.rb) | MCP server for Artifact Hub                                        |
| [agent-repos](Formula/agent-repos.rb)         | Maintain pinned clones of reference repositories for coding agents |
| [imessage-relay-cli](Formula/imessage-relay-cli.rb) | Legacy CLI formula, deprecated from November 1, 2026 |

## Usage

Install a formula:

```bash
brew install actioneer
brew install artifacthub-mcp
brew install agent-repos
```

## Available Casks

| Cask | Description |
| ---- | ----------- |
| [imessage-relay](Casks/imessage-relay.rb) | Stable Apple Messages relay app and CLI |
| [imessage-relay@rc](Casks/imessage-relay@rc.rb) | Release candidate of the app and CLI |

Install the stable release:

```bash
brew install --cask luxass/tap/imessage-relay
```

The current 0.4.0 stable cask installs the CLI through its formula dependency.
Subsequent combined releases and the RC cask install the CLI directly from the app ZIP.

### Test a release candidate

A release candidate is a preview build for testing before a stable release.
The RC cask starts at `0.5.0-rc.2`. Future prereleases open PRs updating only
`imessage-relay@rc`. Stable releases update only `imessage-relay`.

Quit the relay before switching versions. If the stable cask is installed,
uninstall it with `brew uninstall --cask luxass/tap/imessage-relay`.
If the standalone CLI formula is installed, uninstall it with
`brew uninstall --formula luxass/tap/imessage-relay-cli`. Then run:

```sh
brew install --cask luxass/tap/imessage-relay@rc
imessage-relay --version
imessage-relay --help
```

The RC and stable casks conflict because they install the same app and command.
They use the same configuration. To return to stable, uninstall `imessage-relay@rc`
and install `imessage-relay`. Do not use `--zap` when switching if you want to keep the app configuration.

## CI checks

[CI](.github/workflows/ci.yaml) uses stable Homebrew syntax checks and tests changed formulae on macOS and Linux.
Separate macOS jobs install each changed relay cask, check that the app exists,
compare the CLI version with the cask version, run `--help`, and uninstall the cask.
These jobs do not launch the app or start the relay.

[CI Security](.github/workflows/ci-security.yaml) calls the shared Zizmor workflow at a pinned release commit.
It runs when workflow or Zizmor configuration files change, and it can also run manually.
Security findings fail the check. The shared workflow uploads results to GitHub code scanning.
Its reporting and identity-token permissions stay separate from the Homebrew test jobs.

The PR wait timer applies only to changes under `Formula/` or `Casks/`, including renames out of those directories.
Other PRs skip the timer but still report the required `wait` check.
Change-detection errors or failed timers fail that check rather than bypassing it.

## License

Published under [MIT License](./LICENSE).
