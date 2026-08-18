#!/bin/bash
# 4 formats x 2 videos: 9:16 vertical (blur-pad), 1:1 square (center crop), silent, 4s sting
set -e
cd /home/ubuntu/.hermes/projects/clean-windows-tv/intro
mkdir -p formats

for src in intro_v1e_take1 intro_v1c_suds_reveal; do
  # 9:16 vertical 1080x1920 — blurred fill background, sharp centered foreground
  ffmpeg -y -v error -i $src.mp4 -filter_complex \
    "[0:v]scale=1080:1920:force_original_aspect_ratio=increase,crop=1080:1920,gblur=sigma=30[bg];[0:v]scale=1080:-2[fg];[bg][fg]overlay=(W-w)/2:(H-h)/2,format=yuv420p[v]" \
    -map "[v]" -map 0:a -c:v libx264 -crf 18 -c:a copy formats/${src}_vertical_9x16.mp4

  # 1:1 square 1080x1080 — center crop (logo is centered, fits)
  ffmpeg -y -v error -i $src.mp4 -vf "crop=1080:1080:(iw-1080)/2:0,format=yuv420p" \
    -c:v libx264 -crf 18 -c:a copy formats/${src}_square_1x1.mp4

  # silent full-length (for Resolve)
  ffmpeg -y -v error -i $src.mp4 -an -c:v copy formats/${src}_silent.mp4

  # 4-second sting: last 4s (wipe finish -> settled logo), keep audio
  ffmpeg -y -v error -sseof -4 -i $src.mp4 -c:v libx264 -crf 18 -c:a aac -b:a 128k formats/${src}_sting_4s.mp4
done

echo "ALL DONE"
ls -la formats/
