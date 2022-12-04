#!/bin/bash

# Check if FFmpeg is installed
if ! [ -x "$(command -v ffmpeg)" ]; then
    echo 'Error: FFmpeg is required to run this script but it is not installed.' >&2
    exit 1
fi

# Ask for the path to a single WebM file or a directory containing WebM files
read -p "Enter the path to a single WebM file or a directory containing WebM files: " path

# Chcek if the path leads to a file or a directory which the user has read and write access to
if [ ! -f "$path" ] && [ ! -d "$path" ] || [ ! -r "$path" ] || [ ! -w "$path" ]; then
    echo "The path you entered is not a file or a directory or you do not have sufficient permissions to read and write to it."
    exit 1
fi

# Get absolute path to the file or directory
path=$(cd "$(dirname "$path")" && pwd)/$(basename "$path")

# Check if the path leads to a file or a directory
if [ -f "$path" ]; then
    # Set a type variable to "file"
    type="file"
elif [ -d "$path" ]; then
    # Set a type variable to "directory"
    type="directory"
fi

# Confirm the settings
printf "\nOperation details:\n"
if [ "$type" = "file" ]; then
    printf -- "- selected file: $path\n- output file: ${path%.*}.mp4\n- original file will be preserved\n\n"
else
    printf -- "- selected directory: $path\n- all WebM files in the directory will be converted to MP4, original files will be preserved\n\n"
fi

read -p "Is this correct? [y/N] " -n 1 -r answer

if [ "$answer" != "y" ] && [ "$answer" != "Y" ]; then
    printf "\nOperation cancelled.\n"
    exit 1
else 
    printf "\n\n"
fi

# Conversion function
function convert {
    # Get the name of the file without the extension
    filename="${file%.*}"

    # Convert the file
    ffmpeg -i "$file" -c:v libx264 -c:a aac "$filename.mp4"

    # Print the name of the converted file
    echo "Converted file: $filename.mp4"
}

# Convert the file or files in the directory using the conversion function
if [ "$type" = "file" ]; then
    cd "$(dirname "$path")"
    file=$(basename "$path")
    convert "$file"
else
    cd "$path"
    for file in *.webm; do
        convert "$file"
    done
fi

# Exit with success
printf "\nDone.\n"
exit 0
