# WebM to MP4

This script converts WebM files to MP4 using [FFmpeg](https://ffmpeg.org/). The source files are not modified, and the converted files are saved in the same directory as the source files with the same name but with the `.mp4` extension. It can be used to convert singular files or entire directories.

## Requirements

- [FFmpeg](https://ffmpeg.org/)

## Usage

You can use the script in two ways:

1. Use interactive mode by running the script without any arguments:

    ```bash
    ./webm-to-mp4.sh
    ```

2. Use command line arguments:

    ```bash
    ./webm-to-mp4.sh [-p path] [-y]
    ```

    Available arguments:

    - `-p` - path to the file or directory of files to convert
    - `-y` - automatically answer yes to all prompts
