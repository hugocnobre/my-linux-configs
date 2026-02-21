#!/bin/bash

# Ignore case sensitivity for file matching
shopt -s nocaseglob

for i in *.mp4; do
  # Skip if no MP4 files exist
  [ -e "$i" ] || continue

  # Extract the filename without the extension
  filename="${i%.*}"

  # Use ffmpeg to convert the MP4 audio to WAV
  ffmpeg -i "$i" -vn -acodec pcm_s16le "${filename}.wav"
done
