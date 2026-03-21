---
name: github
description: Interact with GitHub via the GitHub CLI (gh) for repository management, issues, pull requests, and workflows. Use when the user needs to create or manage GitHub repositories, open/merge PRs, manage issues, or interact with GitHub Actions.
---

# GitHub

Interact with GitHub repositories, issues, pull requests, and workflows using the GitHub CLI.

## Prerequisites

GitHub CLI (`gh`) must be installed and authenticated:
```bash
gh auth status
gh auth login  # If not authenticated
```

## Capabilities

- Repository operations (create, clone, fork)
- Pull request management (create, review, merge)
- Issue tracking (create, list, close)
- Workflow and Actions monitoring
- Release management

## Common Commands

```bash
# Repository
git repo create <name> --private
git repo clone <owner>/<repo>
git repo fork <owner>/<repo>

# Pull Requests
git pr create --title "Title" --body "Description"
git pr list
git pr checkout <number>
git pr merge <number>
git pr review <number> --approve

# Issues
git issue create --title "Title" --body "Description"
git issue list
git issue close <number>

# Workflows
git run list
git run watch <run-id>
```

## Scripts

- `pr-create.sh` - Create PR with template
- `issue-from-template.sh` - Create issue from template

## References

- `references/pr-templates.md` - PR template examples
