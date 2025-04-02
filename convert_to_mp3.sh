#!/bin/bash
# Script to convert all WAV files to MP3 in the samples directory

# Check if ffmpeg is installed
if ! command -v ffmpeg &> /dev/null; then
    echo "ffmpeg is required but not installed. Please install it first."
    echo "You can install it using: brew install ffmpeg (on macOS with Homebrew)"
    exit 1
fi

# Create the samples directory if it doesn't exist
mkdir -p samples

# Convert all WAV files to MP3
for wav_file in samples/*.wav; do
    if [ -f "$wav_file" ]; then
        base_name=$(basename "$wav_file" .wav)
        echo "Converting $wav_file to samples/$base_name.mp3"
        ffmpeg -i "$wav_file" -codec:a libmp3lame -qscale:a 2 "samples/$base_name.mp3"
    fi
done

echo "Conversion complete!"
