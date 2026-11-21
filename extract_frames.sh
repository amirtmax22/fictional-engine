#!/usr/bin/env bash
# Usage: ./tools/extract_frames.sh ton618.mp4
# Converts a 4K video into looping frames (854x480, 24fps, first 10s) for the background.
set -e
OUT="src/main/resources/assets/blackhole/bg"
mkdir -p "$OUT"
ffmpeg -i "$1" -t 10 -vf "fps=24,scale=854:480:flags=lanczos" -start_number 0 "$OUT/frame_%03d.png"
echo "Frames written to $OUT"
