#!/bin/bash
LOG_FILE="/var/log/my-app.log"
LAST_HASH=$(redis-cli GET "my_app_log_hash")
CURRENT_HASH=$(md5sum "$LOG_FILE" | awk '{ print $1 }')
if [ "$CURRENT_HASH" != "$LAST_HASH" ]; then
    FILE_SIZE=$(stat -c %s "$LOG_FILE")
    LAST_MODIFIED_DATE=$(stat -c %y "$LOG_FILE")
    redis-cli HSET "my_app_log_info" "size" "$FILE_SIZE" "last_modified" "$LAST_MODIFIED_DATE"
    redis-cli SET "my_app_log_hash" "$CURRENT_HASH"
    echo "Файл змінився. Розмір: $FILE_SIZE байт. Остання зміна: $LAST_MODIFIED_DATE"
fi
