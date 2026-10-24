
#!/bin/bash
set -e

if [ -z "$YOUTUBE_STREAM_KEY" ]; then
  echo "ERROR: Set YOUTUBE_STREAM_KEY in Render Environment."
  exit 1
fi

export DISPLAY=:99
Xvfb :99 -screen 0 1280x720x24 &
sleep 3

chromium \
  --no-sandbox \
  --disable-dev-shm-usage \
  --disable-gpu \
  --no-first-run \
  --kiosk \
  --window-size=1280,720 \
  https://sheraz670.github.io/FlagsBattle/ &

node -e 'require("http").createServer((req,res)=>{res.end("FlagsBattle live runner is running")}).listen(process.env.PORT || 10000,"0.0.0.0")' &

sleep 15

exec ffmpeg -hide_banner -loglevel info \
  -f x11grab -framerate 30 -video_size 1280x720 -i :99.0 \
  -f lavfi -i anullsrc=channel_layout=stereo:sample_rate=44100 \
  -c:v libx264 -preset veryfast -b:v 2500k \
  -maxrate 2500k -bufsize 5000k -pix_fmt yuv420p -g 60 \
  -c:a aac -b:a 128k \
  -f flv "rtmp://a.rtmp.youtube.com/live2/${YOUTUBE_STREAM_KEY}"
  
