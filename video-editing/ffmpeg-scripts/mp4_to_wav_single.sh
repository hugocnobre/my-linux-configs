#!/bin/bash

for i in *.mp4; do
  # Extract the filename without the extension
  filename="${i%.mp4}"

  # Convert only the audio while keeping the video codec intact
  ffmpeg -i "$i" -c:v copy -c:a pcm_s16le "${filename}_converted.mp4"
done
