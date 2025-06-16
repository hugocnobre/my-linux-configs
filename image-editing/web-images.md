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

## Usage

1. Place the script in the directory containing your images
2. Open the terminal in that directory

```
cd /path/to/your/images
```

3. Run the script

```
./optimize_images.sh
```

4. Optimized .webp images will appear in:
- ./optimized_images/ (folder in the selected directory)

## Compression Options

The script provides two modes of Webp compression:

### Option A: Lossless WebP (enabled by default)
- Best for screenshots, logos, or icons
- Retains 100% of original image dat
- Larger file sizes

### Option B: Lossy WebP
- Ideal for photographs and large batches
- Great balance of image quality and size
- File size is significantly reduced

To switch to lossy:
1. Comment out the lossless section (OPTION A)
2. Uncomment the lossy section (OPTION B) and adjust the -quality value if needed

Example:

```
# -define webp:lossless=true         ← Comment this
-quality 85                          ← Uncomment this
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

```
- 1200x> → resize width to 1200px max, preserving aspect ratio
- x800> → resize height to 800px max, preserving aspect ratio
```

Ensures that images smaller than the target size are not resized

Example: Resize to max 1920x1080

```
-resize "1920x>" \
-resize "x1080>" \
```

Make sure both lines are updated to avoid distorting the image proportions.

### To disable resizing entirely

Remove or comment out the two -resize lines:

```
# -resize "1200x>" \
# -resize "x800>" \
```
