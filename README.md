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
| [imessage-relay-cli](Formula/imessage-relay-cli.rb) | Command-line interface for the local Apple Messages relay |

## Usage

Install a formula:

```bash
brew install actioneer
brew install artifacthub-mcp
brew install agent-repos
brew install imessage-relay-cli
```

## Available Casks

| Cask | Description |
| ---- | ----------- |
| [imessage-relay](Casks/imessage-relay.rb) | Menu bar app for the local Apple Messages relay |

Install the menu bar app:

```bash
brew install --cask luxass/tap/imessage-relay
```

The cask also installs the CLI formula. Install `imessage-relay-cli` directly
if you only need the command line version.

## License

Published under [MIT License](./LICENSE).
