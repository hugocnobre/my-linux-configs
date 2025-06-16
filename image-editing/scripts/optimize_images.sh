#!/bin/bash

# Name: optimize_images.sh
# Description: Converts and optimizes PNG and JPEG images in the current directory to WebP format.
#              Resizes images proportionally to a maximum width of 1200px and a maximum height of 800px.
#              Leaves smaller images untouched. Stores optimized images in 'optimized_images' directory.

# --- Configuration ---

# Define the output directory for optimized images
OUTPUT_DIR="optimized_images"

# Define the source file patterns to process
INPUT_PATTERNS=("*.png" "*.jpg" "*.jpeg")

# --- Script Logic ---

echo "--- Starting Image Optimization ---"

# 1. Create the output directory if it doesn't already exist
mkdir -p "$OUTPUT_DIR"
if [ $? -ne 0 ]; then
    echo "Error: Failed to create directory '$OUTPUT_DIR'. Check permissions."
    exit 1
fi

# 2. Check if any matching files exist
found_files=false
for pattern in "${INPUT_PATTERNS[@]}"; do
    if find . -maxdepth 1 -iname "$pattern" -print -quit | grep -q .; then
        found_files=true
        break
    fi
done

if [ "$found_files" = false ]; then
    echo "No matching image files (*.png, *.jpg, *.jpeg) found in the current directory. Exiting."
    exit 0
fi

echo "Processing images into '$OUTPUT_DIR'..."

# 3. Process each file type
for pattern in "${INPUT_PATTERNS[@]}"; do
    magick mogrify \
        -path "$OUTPUT_DIR" \
        -format webp \
        -strip \
        -resize "1200x>" \
        -resize "x800>" \
        -define webp:lossless=true \
        $pattern
done

# 4. Check if the mogrify command completed successfully
if [ $? -eq 0 ]; then
    echo "--- Optimization Complete! ---"
    echo "Optimized WebP images are now in the '$OUTPUT_DIR' directory."
else
    echo "--- Error: Image optimization failed! ---"
    echo "Please check your ImageMagick installation and ensure you have permission to write to '$OUTPUT_DIR'."
    exit 1
fi
