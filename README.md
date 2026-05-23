# homebrew-tap

Homebrew tap for luxass' projects.

## Install

```bash
brew tap luxass/tap
```

## Available Formulas

| Formula | Description |
| --- | --- |
| [actioneer](Formula/actioneer.rb) | CLI tool for GitHub Actions workflows |
| [artifacthub-mcp](Formula/artifacthub-mcp.rb) | MCP server for Artifact Hub |

## Usage

Install a formula:

```bash
brew install actioneer
brew install artifacthub-mcp
```

## Repository Security

This repository enforces a minimum 10-minute wait time on all PRs to `main`.

### Setup (one-time)

1. **Create Environment** → Settings → Environments → New environment named `main`
   - Enable **Wait timer** → set to `10` minutes
2. **Branch Protection** → Settings → Branches → Add rule for `main`
   - Require a pull request before merging
   - Require status checks to pass → select `PR Wait Timer / wait`
   - Include administrators

## License

MIT
