---
name: project-runner
description: Execute project commands (npm, pip, make, etc.) and interpret output for build, test, and development workflows. Use when running package manager commands, build scripts, or any project-specific tooling that produces output to analyze.
---

# Project Runner

Execute project commands and interpret results for autonomous development workflows.

## Capabilities

- Run package manager commands (npm, yarn, pip, poetry)
- Execute build scripts and compile code
- Run development servers
- Interpret command output and exit codes
- Detect common errors and suggest fixes

## Usage

Use `exec` to run commands and capture output:

```bash
# NPM/Yarn
npm install
npm run build
npm test
npm run lint

# Python
pip install -r requirements.txt
python -m pytest
python setup.py build

# Make/CMake
make
make test
make clean
```

## Auto-Detection

Detect project type by looking for files:
- `package.json` → Node.js/npm project
- `requirements.txt` / `pyproject.toml` → Python
- `Cargo.toml` → Rust
- `Makefile` → Make
- `Dockerfile` → Docker

## Scripts

- `detect-project.sh` - Detect project type and available commands
- `run-with-retry.sh` - Run command with automatic retry on failure
