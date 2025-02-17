#!/bin/bash

# Loop through all MP4 files
for i in *.mp4; do
  # Skip if no MP4 files exist
  [ -e "$i" ] || continue

  # Extract the filename without the extension
  filename="${i%.mp4}"

  # Convert MP4 to ProRes MOV (software encoding for ProRes)
  ffmpeg -i "$i" \
    -c:v prores_ks -profile:v 3 -qscale:v 9 \
    -c:a pcm_s16le \
    "${filename}_prores.mov"
done
