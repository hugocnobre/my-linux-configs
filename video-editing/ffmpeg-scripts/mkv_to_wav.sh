#!/bin/bash

# Loop through all .mkv files
for i in *.mkv; do
  # Remove the .mkv extension from the filename
  filename="${i%.mkv}"

  # Convert using ffmpeg
  ffmpeg -i "$i" -vn -acodec pcm_s16le "${filename}.wav"
done
