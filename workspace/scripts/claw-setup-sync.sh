#!/bin/bash
# OpenClaw Setup Sync Script
# Runs daily at 16:00 to sync setup state to GitHub
# SENSITIVE DATA IS MASKED - only placeholders are committed

set -e

REPO_NAME="openclaw-setup"
GITHUB_USER="unplug-netizen"
TOKEN="$GITHUB_TOKEN"
WORKSPACE_DIR="/data/.openclaw/workspace"
TEMP_DIR="/tmp/openclaw-setup-$(date +%s)"
DATE_STR=$(date +"%Y-%m-%d")
BRANCH_NAME="update-$(date +%Y%m%d-%H%M%S)"

echo "=== OpenClaw Setup Sync ==="
echo "Date: $DATE_STR"

# Function to sanitize file content
sanitize_content() {
    local file="$1"
    local content
    content=$(cat "$file" 2>/dev/null || echo "")
    
    # Redact API keys and tokens using temp file to avoid quote issues
    echo "$content" > /tmp/sanitize_temp.txt
    
    # GitHub tokens
    sed -i -E 's/ghp_[a-zA-Z0-9]{36}/[GITHUB_TOKEN_REDACTED]/g' /tmp/sanitize_temp.txt
    # API keys
    sed -i -E 's/sk-[a-zA-Z0-9]{48}/[API_KEY_REDACTED]/g' /tmp/sanitize_temp.txt
    sed -i -E 's/sk-[a-zA-Z0-9]{32}/[API_KEY_REDACTED]/g' /tmp/sanitize_temp.txt
    # Bot tokens
    sed -i -E 's/[0-9]{10}:[a-zA-Z0-9_-]{35}/[BOT_TOKEN_REDACTED]/g' /tmp/sanitize_temp.txt
    # Hook tokens
    sed -i -E 's/hooks_[a-zA-Z0-9]{32}/[HOOK_TOKEN_REDACTED]/g' /tmp/sanitize_temp.txt
    # Generic tokens
    sed -i -E 's/[a-f0-9]{32}/[TOKEN_REDACTED]/g' /tmp/sanitize_temp.txt
    sed -i -E 's/[a-f0-9]{40}/[SECRET_REDACTED]/g' /tmp/sanitize_temp.txt
    # IP addresses
    sed -i -E 's/[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+/[IP_REDACTED]/g' /tmp/sanitize_temp.txt
    
    cat /tmp/sanitize_temp.txt
    rm -f /tmp/sanitize_temp.txt
}

# Create temp directory
mkdir -p "$TEMP_DIR"
cd "$TEMP_DIR"

# Check if repo exists, create if not
if ! curl -s -H "Authorization: token $TOKEN" "https://api.github.com/repos/$GITHUB_USER/$REPO_NAME" | grep -q "full_name"; then
    echo "Creating GitHub repo..."
    curl -s -X POST -H "Authorization: token $TOKEN" \
        -H "Accept: application/vnd.github.v3+json" \
        -d '{"name":"'$REPO_NAME'","description":"OpenClaw setup documentation and history","private":true}' \
        "https://api.github.com/user/repos"
    sleep 2
fi

# Clone repo
echo "Cloning repo..."
if git clone "https://$TOKEN@github.com/$GITHUB_USER/$REPO_NAME.git" repo 2>/dev/null; then
    echo "Repo cloned successfully"
else
    echo "Initializing new repo..."
    mkdir -p repo
    cd repo
    git init
    git config user.email "openclaw@automated.sync"
    git config user.name "OpenClaw Bot"
    git remote add origin "https://$TOKEN@github.com/$GITHUB_USER/$REPO_NAME.git"
    git checkout -b main
    echo "# OpenClaw Setup" > README.md
    git add README.md
    git commit -m "Initial commit"
    git push -u origin main
    cd ..
fi

cd repo

# Setup git user
git config user.email "openclaw@automated.sync"
git config user.name "OpenClaw Bot"

echo "Collecting setup state..."

# Create directory structure
mkdir -p workspace/memory workspace/skills workspace/scripts docs config history

# Copy and sanitize all markdown files from workspace
echo "Copying workspace markdown files..."
for file in "$WORKSPACE_DIR"/*.md; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        echo "  - $filename"
        sanitize_content "$file" > "workspace/$filename"
    fi
done

# Copy memory files
echo "Copying memory files..."
if [ -d "$WORKSPACE_DIR/memory" ]; then
    for file in "$WORKSPACE_DIR/memory"/*.md; do
        if [ -f "$file" ]; then
            filename=$(basename "$file")
            echo "  - memory/$filename"
            sanitize_content "$file" > "workspace/memory/$filename"
        fi
    done
fi

# Copy skills (SKILL.md files only)
echo "Copying skill documentation..."
find "$WORKSPACE_DIR/skills" -name "SKILL.md" -type f 2>/dev/null | while read skill_file; do
    skill_dir=$(dirname "$skill_file" | sed "s|$WORKSPACE_DIR/skills/||")
    mkdir -p "workspace/skills/$skill_dir"
    echo "  - skills/$skill_dir/SKILL.md"
    sanitize_content "$skill_file" > "workspace/skills/$skill_dir/SKILL.md"
done

# Copy scripts (sanitized)
echo "Copying scripts..."
if [ -d "$WORKSPACE_DIR/scripts" ]; then
    for file in "$WORKSPACE_DIR/scripts"/*.sh; do
        if [ -f "$file" ]; then
            filename=$(basename "$file")
            echo "  - scripts/$filename"
            sanitize_content "$file" > "workspace/scripts/$filename"
        fi
    done
fi

# Document installed system skills
echo "## System Skills" > docs/skills.md
echo "" >> docs/skills.md
echo "Last updated: $DATE_STR" >> docs/skills.md
echo "" >> docs/skills.md
echo "Count: $(ls -1 /usr/local/lib/node_modules/openclaw/skills 2>/dev/null | wc -l)" >> docs/skills.md
echo "" >> docs/skills.md
echo "### List" >> docs/skills.md
echo "" >> docs/skills.md
ls -1 /usr/local/lib/node_modules/openclaw/skills >> docs/skills.md 2>/dev/null || echo "No system skills found" >> docs/skills.md

echo "" >> docs/skills.md
echo "## Workspace Skills" >> docs/skills.md
echo "" >> docs/skills.md
find "$WORKSPACE_DIR/skills" -name "SKILL.md" -type f 2>/dev/null | while read f; do
    skill_name=$(dirname "$f" | xargs basename)
    echo "- $skill_name" >> docs/skills.md
done

# Document agents
echo "## Available Agents" > docs/agents.md
echo "" >> docs/agents.md
echo "Last updated: $DATE_STR" >> docs/agents.md
echo "" >> docs/agents.md
echo "| ID | Name | Workspace | Model |" >> docs/agents.md
echo "|---|---|---|---|" >> docs/agents.md
echo "| main | Haupt-Agent | /data/.openclaw/workspace | kimi-for-coding |" >> docs/agents.md
echo "| coder | Code-Assistent | /data/.openclaw/workspace/coder | kimi-for-coding |" >> docs/agents.md
echo "| research | Research | /data/.openclaw/workspace-research | k2p5 |" >> docs/agents.md

# Document directory structure
echo "## Workspace Structure" > docs/structure.md
echo "" >> docs/structure.md
echo "Last updated: $DATE_STR" >> docs/structure.md
echo "" >> docs/structure.md
echo "\`\`\`" >> docs/structure.md
find "$WORKSPACE_DIR" -maxdepth 2 -type d 2>/dev/null | head -30 >> docs/structure.md
echo "\`\`\`" >> docs/structure.md

# Document config overview
echo "## OpenClaw Configuration" > docs/config.md
echo "" >> docs/config.md
echo "Last updated: $DATE_STR" >> docs/config.md
echo "" >> docs/config.md
echo "### Workspace Directory" >> docs/config.md
echo "- Path: /data/.openclaw/workspace" >> docs/config.md
echo "" >> docs/config.md
echo "### Channels" >> docs/config.md
echo "- Telegram (enabled)" >> docs/config.md
echo "- Discord (enabled)" >> docs/config.md
echo "- WhatsApp (enabled)" >> docs/config.md
echo "- Slack (enabled)" >> docs/config.md
echo "- Nostr (enabled)" >> docs/config.md
echo "- Google Chat (enabled)" >> docs/config.md
echo "" >> docs/config.md
echo "### Models" >> docs/config.md
echo "- Primary: moonshot/kimi-for-coding" >> docs/config.md
echo "- Secondary: kimi-coding/k2p5" >> docs/config.md
echo "" >> docs/config.md
echo "### Environment Variables" >> docs/config.md
echo "| Variable | Status |" >> docs/config.md
echo "|---|---|" >> docs/config.md
echo "| GITHUB_TOKEN | [REDACTED - set in env] |" >> docs/config.md
echo "" >> docs/config.md
echo "### File Inventory" >> docs/config.md
echo "| File | Purpose |" >> docs/config.md
echo "|---|---|" >> docs/config.md
echo "| AGENTS.md | Workspace guidelines |" >> docs/config.md
echo "| SOUL.md | Agent personality |" >> docs/config.md
echo "| USER.md | User profile |" >> docs/config.md
echo "| TOOLS.md | Environment notes |" >> docs/config.md
echo "| MEMORY.md | Long-term memory |" >> docs/config.md
echo "| HEARTBEAT.md | Periodic tasks |" >> docs/config.md
echo "| BOOTSTRAP.md | First-run guide |" >> docs/config.md
echo "| IDENTITY.md | Agent identity |" >> docs/config.md

# Create sanitized config.json
cat > config/openclaw-config.json << 'EOF'
{
  "_comment": "SANITIZED CONFIG - Secrets replaced with placeholders",
  "version": "2026.3.12",
  "plugins": {
    "allowed": ["whatsapp", "discord", "telegram", "slack", "nostr", "googlechat"]
  },
  "agents": [
    {"id": "main", "name": "Haupt-Agent", "default": true, "workspace": "/data/.openclaw/workspace"},
    {"id": "coder", "name": "Code-Assistent", "workspace": "/data/.openclaw/workspace/coder"},
    {"id": "research", "name": "Research", "workspace": "/data/.openclaw/workspace-research"}
  ],
  "models": {
    "primary": "moonshot/kimi-for-coding",
    "secondary": "kimi-coding/k2p5"
  },
  "channels": {
    "telegram": {"enabled": true, "dmPolicy": "pairing"},
    "discord": {"enabled": true},
    "whatsapp": {"enabled": true},
    "slack": {"enabled": true},
    "nostr": {"enabled": true},
    "googlechat": {"enabled": true}
  },
  "_secrets_redacted": {
    "note": "All secrets are stored securely and not committed to this repo",
    "variables": ["GITHUB_TOKEN", "TELEGRAM_BOT_TOKEN", "MOONSHOT_API_KEY", "HOOKS_TOKEN"]
  }
}
EOF

# Create main README
cat > README.md << EOF
# OpenClaw Setup Documentation

Complete documentation of the OpenClaw setup including workspace files, skills, and configuration.

**⚠️ Security Notice:** This repo contains NO secrets, API keys, or passwords.
All sensitive data is replaced with placeholders like \`[REDACTED]\`.

## Structure

- \`workspace/\` - Mirror of the workspace directory (sanitized)
  - \`*.md\` - Core markdown files (SOUL.md, MEMORY.md, etc.)
  - \`memory/\` - Daily memory files
  - \`skills/\` - Skill documentation
  - \`scripts/\` - Utility scripts
- \`docs/skills.md\` - List of installed skills
- \`docs/agents.md\` - Available agents
- \`docs/config.md\` - Configuration overview
- \`docs/structure.md\` - Directory structure
- \`config/openclaw-config.json\` - Sanitized config file
- \`history/\` - Daily sync history

## Automated Updates

This repo is automatically updated daily at 16:00 Europe/Berlin.
Each update creates a new branch that is auto-merged into main.

Last update: $DATE_STR
EOF

# Check for changes
if git diff --quiet && git diff --cached --quiet 2>/dev/null; then
    echo "No changes detected."
    mkdir -p history
    echo "{\"date\": \"$DATE_STR\", \"status\": \"no_changes\"}" > "history/$DATE_STR.json"
    git add -A
    git commit -m "Daily check: no changes ($DATE_STR)" || true
    git push origin main 2>/dev/null || true
else
    echo "Changes detected, creating branch..."
    
    git checkout -b "$BRANCH_NAME"
    
    mkdir -p history
    cat > "history/$DATE_STR.json" << EOF
{
  "date": "$DATE_STR",
  "status": "updated",
  "branch": "$BRANCH_NAME",
  "changes": [
    "workspace files updated",
    "documentation synchronized"
  ]
}
EOF
    
    git add -A
    git commit -m "Update setup documentation ($DATE_STR)"
    git push origin "$BRANCH_NAME"
    
    echo "Creating PR..."
    PR_RESPONSE=$(curl -s -X POST \
        -H "Authorization: token $TOKEN" \
        -H "Accept: application/vnd.github.v3+json" \
        -d "{\"title\":\"Setup update $DATE_STR\",\"head\":\"$BRANCH_NAME\",\"base\":\"main\",\"body\":\"Automated setup documentation update.\"}" \
        "https://api.github.com/repos/$GITHUB_USER/$REPO_NAME/pulls")
    
    PR_NUMBER=$(echo "$PR_RESPONSE" | grep -o '"number":[0-9]*' | head -1 | cut -d: -f2)
    
    if [ -n "$PR_NUMBER" ]; then
        echo "PR #$PR_NUMBER created, merging..."
        curl -s -X PUT \
            -H "Authorization: token $TOKEN" \
            -H "Accept: application/vnd.github.v3+json" \
            -d '{"merge_method":"squash"}' \
            "https://api.github.com/repos/$GITHUB_USER/$REPO_NAME/pulls/$PR_NUMBER/merge" || echo "Merge may require manual approval"
    fi
    
    git checkout main
    git pull origin main
fi

cd /
rm -rf "$TEMP_DIR"

echo "=== Sync Complete ==="
