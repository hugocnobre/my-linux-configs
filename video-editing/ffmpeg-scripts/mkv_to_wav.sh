#!/bin/bash

# Ignore case sensitivity for file matching
shopt -s nocaseglob

# Loop through all .mkv files
for i in *.mkv; do
  # Skip if no MKV files exist
  [ -e "$i" ] || continue

  # Remove the extension from the filename
  filename="${i%.*}"

  # Convert using ffmpeg
  ffmpeg -i "$i" -vn -acodec pcm_s16le "${filename}.wav"
done