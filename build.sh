#!/bin/sh

# Function to check if a command exists
check_command() {
    if ! command -v "$1" &> /dev/null; then
        echo "Error: $1 is required but not installed."
        echo "Please install it using: $2"
        exit 1
    fi
}

# Find the CV YAML file
filename=$(find . -name "*_CV.yaml" )
if [ -z "$filename" ]; then
    echo "Error: No *_CV.yaml file found in the current directory."
    exit 1
fi

echo "Found CV configuration: $filename"

author_name=$(yq '.cv.name' "$filename")
# Check if author name is empty
if [ -z "$author_name" ]; then
    echo "Error: Author name not found in the CV configuration."
    exit 1
fi

# Set the output file name based on the author name
output_file="${author_name} - Resume.pdf"

rendercv render "$filename" \
--output-folder-name "build" \
--pdf-path "./${output_file}" \
--dont-generate-markdown \
--dont-generate-html \
--dont-generate-png

if [ $? -ne 0 ]; then
    echo "Error: Failed to render the CV."
    exit 1
fi

# Strip out metadata from the PDF and add only the properties we want.
echo "Cleaning metadata and setting document properties..."
exiftool \
    -all:all= \
    -Title="$author_name - Resume" \
    -Author="$author_name" \
    -Keywords="Security Engineering;Incident Response;Detection Engineering" \
    -overwrite_original \
    "$output_file"

echo "Metadata processing complete."
echo "Resume successfully built."
