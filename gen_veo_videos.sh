#!/bin/bash
# Veo video generation — Crystal Clear Window Cleaning
# 4 videos, each ~60-90s. Run sequentially as Veo requires.
set -e

OUTDIR="/home/ubuntu/.hermes/projects/clean-windows-tv/videos"
GEN="/opt/hermes/data/workspace/google_ai/gen_video.py"
mkdir -p "$OUTDIR"

echo "=== [1/4] hero-clean.mp4 — HERO BACKGROUND ==="
# Wide cinematic shot for the full-screen hero — dramatic, sweeping
python3 "$GEN" \
  "Cinematic wide-angle shot of a professional window cleaner in a navy uniform using a large squeegee on a gleaming floor-to-ceiling glass wall of a modern office building, sunlight refracting through perfectly clean glass, water sheets away in slow motion, crystal clear reflections of blue Idaho sky, golden morning light, photorealistic, 4K" \
  --out "$OUTDIR/hero-clean.mp4"
echo "  Done: hero-clean.mp4"

echo "=== [2/4] residential-service.mp4 — RESIDENTIAL SERVICE CARD ==="
# Matches the Residential service card — home, ladder, uniform, suburbs
python3 "$GEN" \
  "Professional window cleaner in uniform on a ladder cleaning the exterior windows of a beautiful single-story suburban home in Boise Idaho, lush green lawn, blue sky, Treasure Valley foothills visible in the background, squeegee technique leaving streak-free sparkling glass, warm sunny day, photorealistic" \
  --out "$OUTDIR/residential-service.mp4"
echo "  Done: residential-service.mp4"

echo "=== [3/4] storefront-clean.mp4 — COMMERCIAL SERVICE CARD ==="
# Matches the Commercial card — storefront, retail, downtown
python3 "$GEN" \
  "Professional window cleaner in uniform using a squeegee to clean a large retail storefront glass window on a sunny downtown Idaho street, the glass transforms from dirty to perfectly clear as the squeegee passes, merchandise visible through spotless glass, welcoming bright storefront, photorealistic" \
  --out "$OUTDIR/storefront-clean.mp4"
echo "  Done: storefront-clean.mp4"

echo "=== [4/4] hero-panorama.mp4 — SPECIALTY / ABOUT / GALLERY ==="
# Matches the Specialty card and About section — high-rise, aerial, impressive
python3 "$GEN" \
  "Aerial drone shot slowly pulling back from glistening clean windows on a multi-story office building in Boise Idaho, Treasure Valley stretching out below, Snake River Plain visible in the distance, rolling foothills, bright sunny day with scattered clouds casting dramatic shadows, windows reflecting blue sky perfectly, photorealistic cinematic drone footage" \
  --out "$OUTDIR/hero-panorama.mp4"
echo "  Done: hero-panorama.mp4"

echo ""
echo "ALL 4 VEO VIDEOS COMPLETE"
ls -lh "$OUTDIR/"
