#!/bin/bash
# run-with-retry.sh - Run a command with automatic retry

set -e

MAX_RETRIES="${MAX_RETRIES:-3}"
DELAY="${DELAY:-5}"
CMD="$@"

if [ -z "$CMD" ]; then
    echo "Usage: MAX_RETRIES=3 DELAY=5 $0 <command>"
    exit 1
fi

attempt=1
while [ $attempt -le $MAX_RETRIES ]; do
    echo "Attempt $attempt/$MAX_RETRIES: $CMD"
    
    if eval "$CMD"; then
        echo "Success!"
        exit 0
    fi
    
    echo "Failed. Retrying in ${DELAY}s..."
    sleep $DELAY
    attempt=$((attempt + 1))
done

echo "Failed after $MAX_RETRIES attempts"
exit 1
