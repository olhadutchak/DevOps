#!/bin/bash
LOG_FILE="/var/log/my-app.log"
LAST_MOD_FILE="/tmp/last_log_mod_time.txt"
CURRENT_SIZE=$(stat -c%s "$LOG_FILE")
CURRENT_MOD_TIME=$(stat -c%y "$LOG_FILE")
if [[ -f "$LAST_MOD_FILE" ]]; then
    LAST_SIZE=$(cat "$LAST_MOD_FILE" | cut -d' ' -f1)
    LAST_MOD_TIME=$(cat "$LAST_MOD_FILE" | cut -d' ' -f2-)

    if [[ "$CURRENT_SIZE" != "$LAST_SIZE" ]]; then
        redis-cli HSET log_info size "$CURRENT_SIZE" mod_time "$CURRENT_MOD_TIME"
    fi
else
    redis-cli HSET log_info size "$CURRENT_SIZE" mod_time "$CURRENT_MOD_TIME"
fi
echo "$CURRENT_SIZE $CURRENT_MOD_TIME" > "$LAST_MOD_FILE"
