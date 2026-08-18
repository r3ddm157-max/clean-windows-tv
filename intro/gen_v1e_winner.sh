#!/bin/bash
# v1e/v1f: exact v1b prompt (good squeegee physics) + sharp 1080p input frame (good logo)
set -x
GV="python3 /opt/hermes/data/workspace/google_ai/gen_video.py"
DIR=/home/ubuntu/.hermes/projects/clean-windows-tv/intro
IMG=$DIR/frame_logo_1080.png
P="Premium logo animation intro. The circular blue window washing company logo stays perfectly centered, crisp, and completely unchanged with all text razor-sharp and readable. A professional squeegee with a black rubber blade and steel handle wipes diagonally across the glass in one smooth confident stroke, clearing water droplets and leaving a streak-free shine with a subtle sparkle glint at the end of the stroke. Fine water droplets bead realistically on the glass surface. Soft studio lighting, shallow depth of field. In the final second, all motion settles calmly with the logo perfectly clean and still. The logo never warps, tilts, or distorts. No camera shake."

$GV "$P" --image "$IMG" --resolution 1080p --out $DIR/intro_v1e_take1.mp4
$GV "$P" --image "$IMG" --resolution 1080p --out $DIR/intro_v1f_take2.mp4

echo "ALL DONE"
ls -la $DIR/intro_v1e_take1.mp4 $DIR/intro_v1f_take2.mp4
