#!/bin/bash
# Creo Daily Summary
# Wird vom Heartbeat aufgerufen, um tägliche Zusammenfassungen zu erstellen

DATE=$(date +"%Y-%m-%d")
DAY=$(date +"%A")

echo "=== Creo Daily Summary - $DATE ($DAY) ==="
echo ""

# Git Status
echo "## Git Status"
cd /data/.openclaw/workspace
if [ -d .git ]; then
    git status --short 2>/dev/null || echo "Keine uncommitted changes"
else
    echo "No git repo"
fi
echo ""

# Offene Aufgaben (aus Memory)
echo "## Offene Aufgaben"
if [ -f /data/.openclaw/workspace/MEMORY.md ]; then
    grep -A 20 "## TODO" /data/.openclaw/workspace/MEMORY.md 2>/dev/null || echo "Keine TODOs gefunden"
else
    echo "Keine MEMORY.md"
fi
echo ""

# System Status
echo "## System Status"
echo "- Disk usage: $(df -h / | tail -1 | awk '{print $5}')"
echo "- Memory: $(free -h | grep Mem | awk '{print $3 "/" $2}')"
echo ""

# Letzte Aktivitäten
echo "## Letzte Aktivitäten"
ls -lt /data/.openclaw/workspace/memory/*.md 2>/dev/null | head -3 | awk '{print "- " $9}' || echo "Keine Memory-Dateien"
echo ""

echo "=== Ende Summary ==="
