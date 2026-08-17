#!/bin/bash
# Regenerate 3 problem videos — result-focused prompts (no squeegee-in-action)
# hero-panorama.mp4 is GOOD — leave it alone
set -e

OUTDIR="/home/ubuntu/.hermes/projects/clean-windows-tv/videos"
GEN="/opt/hermes/data/workspace/google_ai/gen_video.py"

echo "=== [1/3] hero-clean.mp4 — HERO BACKGROUND ==="
# Wide cinematic — sparkling clean glass, no cleaning action, just the result
python3 "$GEN" \
  "Cinematic slow pan across the exterior of a gleaming modern office building in Boise Idaho, floor-to-ceiling windows perfectly clean and reflecting brilliant blue sky and white clouds, late afternoon golden light catching the spotless glass, no people no cleaning equipment, breathtaking architectural beauty, photorealistic 4K" \
  --out "$OUTDIR/hero-clean.mp4"
echo "  Done: hero-clean.mp4"

echo "=== [2/3] residential-service.mp4 — RESIDENTIAL SERVICE CARD ==="
# Professional + home — but NOT mid-clean. Worker posed, windows already clean.
python3 "$GEN" \
  "Friendly professional window cleaner in a clean navy uniform standing confidently beside a beautiful single-story suburban home in Boise Idaho, sparkling clean windows gleaming behind him, extension pole resting on his shoulder, green lawn, Idaho foothills and blue sky in the background, sunny day, photorealistic" \
  --out "$OUTDIR/residential-service.mp4"
echo "  Done: residential-service.mp4"

echo "=== [3/3] storefront-clean.mp4 — COMMERCIAL SERVICE CARD ==="
# Storefront result shot — pristine glass, no cleaning in progress
python3 "$GEN" \
  "Beautiful sunlit retail storefront on a quiet downtown Boise Idaho street, floor-to-ceiling glass windows perfectly clean and gleaming, neatly dressed mannequins and products visible through the flawless glass, professional window cleaning van parked outside, blue sky reflection in the spotless windows, photorealistic" \
  --out "$OUTDIR/storefront-clean.mp4"
echo "  Done: storefront-clean.mp4"

echo ""
echo "ALL 3 REPLACEMENT VIDEOS COMPLETE"
ls -lh "$OUTDIR/"
