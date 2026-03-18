---
name: dependency-manager
description: Manage project dependencies including installation, updates, security audits, and outdated package checks. Use when installing packages, updating dependencies, checking for vulnerabilities, or managing package versions.
---

# Dependency Manager

Manage project dependencies, updates, and security audits.

## Supported Package Managers

- **Node.js**: npm, yarn, pnpm
- **Python**: pip, pipenv, poetry
- **Rust**: cargo
- **Go**: go modules

## Capabilities

- Install dependencies
- Update packages to latest versions
- Check for outdated packages
- Run security audits
- Clean up unused dependencies
- Lock file maintenance

## Usage

```bash
# Install dependencies
npm install
pip install -r requirements.txt
cargo build

# Check for updates
npm outdated
pip list --outdated
cargo update --dry-run

# Update packages
npm update
npm audit fix
pip install --upgrade <package>

# Security audit
npm audit
pip-audit
cargo audit
```

## Scripts

- `audit-security.sh` - Run security audit on all dependencies
- `update-all.sh` - Update all dependencies safely
- `cleanup-deps.sh` - Remove unused dependencies
