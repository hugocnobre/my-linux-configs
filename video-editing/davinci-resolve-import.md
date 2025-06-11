# Requierements
- FFMPEG
	- Debian: `sudo apt install ffmpeg`
	- Fedora: `sudo dnf install ffmpeg ffmpeg-devel`
	- Arch: `sudo pacman -S ffmpeg`
- On Fedora you might need to install RPM fusion

# OBS
- The most simple option is to record your footage
	- With format supported by Davinci Resolve

Go to
1. Settings
2. Output
3. Recording

## Type Standard
- Recording Format: MOV
- Audio Encoder: FFMPEG PCM
- Video Encoder
	- Might need to change it to see different options

You can use AMD hardware enconding via VAAPI. And I'm choosing to use MKV and AAC audio because that's what has been working for me.

I have tried PCM before and it borked my audio. So I will jsut convert the files later because it's super easy to do.

## Type Custom Output
1. Change "Type" to "Custom Output (FFmpeg)"
2. Set "Container Format" to "mov"
3. Set "Video Encoder" to "mpeg4"
4. Set "Audio Encoder" to "pcm_s16le"

# Davinci Resolve Studio
- If using MKV and AAC audio you only need to encode the audio
	- Create a "mkv_to_wav.sh" file or download it
- If using MP4 footage and AAC audio you only need to encode audio
	- Create "mp4_to_wav.sh" file or download it
- Put scripts in a folder (for example "/Videos/Encoding")
- Enable "run as executable"
  - File manager properties
  - Or use the command chmod +x filename.sh (replace the filename)
- Execute desired script to convert inside the folder
	 - `./mkv_to_wav.sh`
	 - `./mp4_to_wav.sh`

## MKV to WAV

- [Download mkv_to_wav.sh](ffmpeg-scripts/mkv_to_wav.sh)

```sh
#!/bin/bash

# Loop through all .mkv files
for i in *.mkv; do
  # Remove the .mkv extension from the filename
  filename="${i%.mkv}"

  # Convert using ffmpeg
  ffmpeg -i "$i" -vn -acodec pcm_s16le "${filename}.wav"
done
```

## MP4 to WAV

- [Download mp4_to_wav.sh](ffmpeg-scripts/mp4_to_wav.sh)

``` sh
#!/bin/bash

for i in *.mp4; do
  # Extract the filename without the extension
  filename="${i%.mp4}"

  # Use ffmpeg to convert the MP4 audio to WAV
  ffmpeg -i "$i" -vn -acodec pcm_s16le "${filename}.wav"
done
```

# Davinci Resolve
- Easiest way is to convert to ProRes MOV and the audio to pcm
	- Create "mp4_to_mov.sh" file or download it
- Put script in a folder (for example "/Videos/Encoding")
- Enable "run as executable"
  - File manager properties
  - Or use the command chmod +x filename.sh (replace the filename)
- Execute the script `./mp4_to_mov.sh`

- [Download mp4_to_mov.sh](ffmpeg-scripts/mp4_to_mov.sh)

```sh
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
```
