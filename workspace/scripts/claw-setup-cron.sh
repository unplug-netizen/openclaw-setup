#!/bin/bash
# OpenClaw Setup Overview - Cron Replacement
# Runs continuously and executes the sync script daily at 16:00

LOG_FILE="/tmp/claw-setup-cron.log"
SCRIPT="/data/.openclaw/workspace/scripts/claw-setup-sync.sh"
TARGET_HOUR=16
TARGET_MINUTE=0

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

log "Starting OpenClaw Setup Overview cron replacement..."
log "Target time: ${TARGET_HOUR}:${TARGET_MINUTE} Europe/Berlin"

LAST_RUN_DATE=""

while true; do
    CURRENT_HOUR=$(date +%H)
    CURRENT_MINUTE=$(date +%M)
    CURRENT_DATE=$(date +%Y-%m-%d)
    
    # Check if it's time to run (16:00) and we haven't run today
    if [ "$CURRENT_HOUR" -eq "$TARGET_HOUR" ] && [ "$CURRENT_MINUTE" -ge "$TARGET_MINUTE" ] && [ "$LAST_RUN_DATE" != "$CURRENT_DATE" ]; then
        log "Starting daily sync..."
        if [ -x "$SCRIPT" ]; then
            "$SCRIPT" >> "$LOG_FILE" 2>&1
            RESULT=$?
            if [ $RESULT -eq 0 ]; then
                log "Sync completed successfully"
            else
                log "Sync failed with exit code $RESULT"
            fi
        else
            log "ERROR: Script not found or not executable: $SCRIPT"
        fi
        LAST_RUN_DATE="$CURRENT_DATE"
    fi
    
    # Sleep for 1 minute
    sleep 60
done
