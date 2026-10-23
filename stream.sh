
#!/bin/bash
set -e

if [ -z "$YOUTUBE_STREAM_KEY" ]; then
  echo "YOUTUBE_STREAM_KEY missing"
  exit 1
fi

mkdir -p /tmp/flagsbattle
cd /tmp/flagsbattle

git clone --depth 1 https://github.com/Sheraz670/FlagsBattle.git game

cd game

echo "Game downloaded."
echo "Browser capture and FFmpeg streaming still need to be connected."
