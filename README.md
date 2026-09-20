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
| [imessage-relay-server](Formula/imessage-relay-server.rb) | Local HTTP API for Apple Messages |

## Usage

Install a formula:

```bash
brew install actioneer
brew install artifacthub-mcp
brew install agent-repos
brew install imessage-relay-server
```

## Available Casks

| Cask | Description |
| ---- | ----------- |
| [imessage-relay](Casks/imessage-relay.rb) | Menu bar app for the local Apple Messages relay |

Install the menu bar app:

```bash
brew install --cask luxass/tap/imessage-relay
```

## License

Published under [MIT License](./LICENSE).
