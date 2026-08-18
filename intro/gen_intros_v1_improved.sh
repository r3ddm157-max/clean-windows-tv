#!/bin/bash
# Improved squeegee-sweep logo intros — 1080p, refined prompts
set -x
GV="python3 /opt/hermes/data/workspace/google_ai/gen_video.py"
DIR=/home/ubuntu/.hermes/projects/clean-windows-tv/intro
IMG=$DIR/frame_logo.png

$GV "Premium logo animation intro. The circular blue window washing company logo stays perfectly centered, crisp, and completely unchanged with all text razor-sharp and readable. A professional squeegee with a black rubber blade and steel handle wipes diagonally across the glass in one smooth confident stroke, clearing water droplets and leaving a streak-free shine with a subtle sparkle glint at the end of the stroke. Fine water droplets bead realistically on the glass surface. Soft studio lighting, shallow depth of field. In the final second, all motion settles calmly with the logo perfectly clean and still. The logo never warps, tilts, or distorts. No camera shake." --image "$IMG" --resolution 1080p --out $DIR/intro_v1b_squeegee_polished.mp4

$GV "Premium logo animation intro. The circular blue window washing logo remains perfectly centered, sharp and unaltered, text crisp. The scene is a sunlit window pane: soapy water sheet and suds slide down over the glass in front of the logo, then a squeegee blade wipes across in two smooth overlapping strokes, squeegeeing the suds away and revealing the logo perfectly clean and bright, with one elegant lens-flare sparkle off the top edge at the end. Motion settles to a calm, clean hold on the final frame. Photorealistic water, professional and satisfying. The logo never warps or distorts. No camera movement." --image "$IMG" --resolution 1080p --out $DIR/intro_v1c_suds_reveal.mp4

echo "ALL DONE"
ls -la $DIR/intro_v1b_squeegee_polished.mp4 $DIR/intro_v1c_suds_reveal.mp4
