---
name: git-operations
description: Execute Git commands for version control operations including status checks, commits, branching, merging, and repository management. Use when the user needs to interact with Git repositories, check repository status, create commits, manage branches, or perform any Git workflow operations.
---

# Git Operations

Execute Git commands to manage repositories and version control workflows.

## Capabilities

- Check repository status and history
- Stage, commit, and push changes
- Create, switch, and merge branches
- View diffs and logs
- Handle stashes and tags
- Clone and fetch repositories

## Usage

Use `exec` to run git commands directly:

```bash
# Status and info
git status
git log --oneline -10
git branch -a

# Making changes
git add <files>
git commit -m "message"
git push origin <branch>

# Branching
git checkout -b <new-branch>
git merge <branch>
git branch -d <branch>
```

## Best Practices

- Always check `git status` before making changes
- Use descriptive commit messages
- Pull before pushing to avoid conflicts
- Create feature branches for isolated work

## Scripts

For complex operations, use scripts in `scripts/`:
- `safe-commit.sh` - Commit with validation
- `branch-cleanup.sh` - Remove merged branches
