
#!/bin/bash
set -e

echo "FlagsBattle YouTube Live setup starting..."

if [ -z "$YOUTUBE_STREAM_KEY" ]; then
  echo "ERROR: Render mein YOUTUBE_STREAM_KEY set karni hogi."
  exit 1
fi

echo "Stream key mil gayi, lekin game capture aur video encoding abhi configure karna baqi hai."

