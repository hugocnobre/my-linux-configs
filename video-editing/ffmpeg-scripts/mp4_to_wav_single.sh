#!/bin/bash

# Ignore case sensitivity for file matching
shopt -s nocaseglob

for i in *.mp4; do
  # Skip if no MP4 files exist
  [ -e "$i" ] || continue

  # Extract the filename without the extension
  filename="${i%.*}"

  # Convert only the audio while keeping the video codec intact
  ffmpeg -i "$i" -c:v copy -c:a pcm_s16le "${filename}_converted.mp4"
done