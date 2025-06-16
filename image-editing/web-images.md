# Optimize_images

Bash script that converts and optimizes images in the current directory into Webp format using [ImageMagick](https://imagemagick.org). It resizes images proportionally to a maximum width of **1200px** and a maximum height of **800px**, while preserving smaller images as-is.

Optimized images are saved to an `optimized_images` directory.

## Features
- Converts PNG images to WebP format
- Option for **lossless** or **lossy** compression
- Resizes images (only if larger than target resolution)
- Preserves original images
- Uses ImageMagick's `mogrify` for efficient processing

## Requirements
- [ImageMagick](https://imagemagick.org)
- Bash shell

## Installation

1. Clone or download this repository
  - [Download optimize_images.sh](scripts/optimize_images.sh)
2. Make the script executable:

```
chmod +x optimize_images.sh
```

3. Install ImageMagick (required for magick mogrify):

Arch

```
sudo pacman -S imagemagick
```

Fedora

```
sudo dnf install imagemagick
```

Debian

```
sudo apt update
sudo apt install imagemagick
```

## Customize Resize Resolution

By default, the script resizes images proportionally to fit within:
- Max width: 1200 pixels
- Max height: 800 pixels

Smaller images will not be upscaled.

### To change the resolution
1. Open optimize_images.sh in a text editor.
2. Locate the -resize options inside the magick mogrify command:

```
-resize "1200x>" \
-resize "x800>" \
```

These two lines mean:
- 1200x> → resize width to 1200px max, preserving aspect ratio
- x800> → resize height to 800px max, preserving aspect ratio

Ensures that images smaller than the target size are not resized

Example: Resize to max 1920x1080

-resize "1920x>" \
-resize "x1080>" \

Make sure both lines are updated to avoid distorting the image proportions.

### To disable resizing entirely

Remove or comment out the two -resize lines:

```
# -resize "1200x>" \
# -resize "x800>" \
```
