#!/bin/bash
# Asche Brothers logo intro animations — 3 variants via Veo image-to-video
set -x
GV="python3 /opt/hermes/data/workspace/google_ai/gen_video.py"
DIR=/home/ubuntu/.hermes/projects/clean-windows-tv/intro
IMG=$DIR/frame_logo.png

$GV "Logo animation intro. The circular blue window washing company logo stays perfectly centered and unchanged, text stays crisp and readable. A soft glass-like light sweep passes diagonally across the logo like a squeegee wiping a window clean, leaving a subtle sparkle. Gentle water droplet shimmer in the background. Clean, professional, minimal motion. The logo itself does not warp or distort." --image "$IMG" --out $DIR/intro_v1_squeegee_sweep.mp4

$GV "Logo animation intro. The circular blue logo remains centered, sharp and unaltered with all text perfectly readable. Soft soap bubbles drift slowly upward in the foreground and background, catching light with iridescent reflections, gently floating past the logo. Subtle slow zoom in toward the logo. Bright, airy, professional. The logo never warps or changes." --image "$IMG" --out $DIR/intro_v2_bubbles.mp4

$GV "Logo animation intro. The circular blue window washing logo stays perfectly centered, crisp, and unchanged. The background behaves like a foggy glass pane being wiped clean: condensation and streaks wipe away in smooth squeegee strokes revealing a bright clean sky-blue gradient, with a final subtle lens-flare sparkle glinting off the edge of the logo. Professional, satisfying, minimal. The logo text stays perfectly readable and undistorted." --image "$IMG" --out $DIR/intro_v3_wipe_clean.mp4

echo "ALL DONE"
ls -la $DIR/*.mp4
