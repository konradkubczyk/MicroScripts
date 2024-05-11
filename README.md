# 📜 My collection of scripts

This repository contains a collection of [Bash](https://www.gnu.org/software/bash/) scripts I've written for various purposes. Some of them may be useful, others not so much...

Feel free to try them out and if you find any bugs or have a suggestion, please [open an issue](https://gitlab.com/konradkubczyk/microscripts/-/issues) or [submit a merge request](https://gitlab.com/konradkubczyk/microscripts/-/merge_requests).

The scripts are independent of each other, so you can download only the ones you need.

## List of contents

These are the scripts currently available in this repository:

- [image-downsizer](image-downsizer) - downsizes images in a directory to a specified maximum width or height using [ImageMagick](https://imagemagick.org/index.php)
- [webm-to-mp4](webm-to-mp4) - converts WebM files to MP4 using [FFmpeg](https://ffmpeg.org/)
- [bulk-image-trimmer](bulk-image-trimmer) - trims images in a directory in bulk to remove empty space surrounding the content using [ImageMagick](https://imagemagick.org/index.php)
- [hardware-metrics-logger](hardware-metrics-logger) - logs a chosen hardware metric to a CSV file every second using [lm_sensors](https://hwmon.wiki.kernel.org/lm_sensors)

Click on the name to go to the script's directory.

## Requirements

[Bash](https://www.gnu.org/software/bash/) is a requirement for all scripts, but some of them may need additional software to work properly. Please refer to the README.md file located in the script's directory for more information.

All the scripts were tested on [Ubuntu](https://ubuntu.com/) Linux.

## Downloading

You can download the scripts individually or as a whole repository.

### Downloading the entire repository

To download the whole repository as a ZIP archive, [click here](https://gitlab.com/konradkubczyk/microscripts/-/archive/main/microscripts-main.zip) or use the following command:
    
```bash
wget https://gitlab.com/konradkubczyk/microscripts/-/archive/main/microscripts-main.zip
```

You can also clone the repository using [Git](https://git-scm.com/):
    
```bash
git clone https://gitlab.com/konradkubczyk/microscripts.git
```

### Downloading individual scripts

To download the scripts individually, navigate to the script's directory or the script itself. You can copy the content of the script or download it as a file.

> Don't forget to make the scripts executable by running `chmod +x <script>`.

## Running

To run the scripts, you need to open a terminal and navigate to the directory where the script is located. Then, you can run the script by typing `./<script>`.

## License

The scripts are licensed under the [MIT License](LICENSE).
