#!/bin/bash

# Check if ImageMagick is installed
if ! [ -x "$(command -v convert)" ]; then
    echo 'Error: ImageMagick is required to run this script but it is not installed.' >&2
    exit 1
fi

# Ask for the path to the directory containing the images
read -p "Enter the path to the directory containing the images: " path

# Chcek if the path leads to a directory which the user has read and write access to
if [ ! -d "$path" ] || [ ! -r "$path" ] || [ ! -w "$path" ]; then
    echo "The path you entered is not a directory or you do not have sufficient permissions to read and write to it."
    exit 1
fi

# Ask for the maximum image size in pixels (vertical/horizontal)
read -p "Enter the maximum image size in pixels (vertical/horizontal): " size

# Check if the size is a number
if ! [[ "$size" =~ ^[0-9]+$ ]]; then
    echo "The size you entered is not a number."
    exit 1
fi

# Get absolute path to the directory
path=$(cd "$path" && pwd)

# Confirm the settings
printf "\nSettings:\n- working directory: $path\n- maximum image size: $size pixels\n\nOriginal images will be overwritten!\n\n"
read -p "Is this correct? [y/N] " -n 1 -r answer
if [ "$answer" != "y" ] && [ "$answer" != "Y" ]; then
    printf "\nOperation cancelled.\n"
    exit 1
else 
    printf "\n\n"
fi

# Loop through all files in the directory
for file in "$path"/*; do

    # Check if the file is an image
    if file --mime-type "$file" | grep -q image; then

        # Check if the image is larger than the maximum size
        if [ $(identify -format "%[fx:w>h?w:h]" "$file") -gt "$size" ]; then

            # Resize the image
            convert "$file" -resize "$size"x"$size" "$file"

            # Print the name of the resized image
            echo "Resized image: $file"
        else
            # Print the name of the image which is not resized
            echo "Image not resized (already smaller than $size pixels): $file"
        fi
    fi
done

# Exit with success
printf "\nDone.\n"
exit 0
