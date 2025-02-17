#!/bin/bash

for i in *.mp4; do
  # Extract the filename without the extension
  filename="${i%.mp4}"

  # Use ffmpeg to convert the MP4 audio to WAV
  ffmpeg -i "$i" -vn -acodec pcm_s16le "${filename}.wav"
done
