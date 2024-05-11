#!/bin/bash

# Check if ImageMagick is installed
if ! command -v convert &> /dev/null
then
  echo "Error: ImageMagick is required to run this script but it is not installed."
  read -p "Press enter to exit..."
  exit 1
fi

# Check if source directory exists
if [ ! -d "to-trim" ]
then
  echo "Error: Source directory 'to-trim' does not exist."
  read -p "Press enter to exit..."
  exit 1
fi

# Get the list of files to process
files=(to-trim/*)

# Get the number of files to process
files_count=${#files[@]}

# Set the number of processed files to 0
processed_files=0

# Create the output directory if it doesn't exist
mkdir -p trimmed

# Loop through the files
for file in "${files[@]}"
do
  # Check if the file is an image
  if [[ $file =~ \.jpg$|\.jpeg$|\.png$|\.gif$ ]]
  then
    # Set the output filepath
    output_file="trimmed/$(basename "$file")"

    # Trim the image
    convert "$file" -trim +repage "$output_file"

    # Increment the number of processed files
    processed_files=$((processed_files+1))

    # Display status
    echo "$processed_files/$files_count: $file -> $output_file"
  fi
done

# Summarize the results
echo "Trimmed $processed_files image(s)."

# Pause the script
read -p "Press enter to exit..."
