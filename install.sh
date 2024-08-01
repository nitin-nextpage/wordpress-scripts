#!/bin/bash

# Download the latest version of WordPress
wget https://wordpress.org/latest.zip

# Check if the download was successful
if [ $? -eq 0 ]; then
    echo "Download successful."

    # Extract the downloaded zip file
    unzip -o latest.zip

    # Check if the extraction was successful
    if [ $? -eq 0 ]; then
        echo "Extraction successful."

        # Synchronize the contents of the wordpress folder to the current directory, including dot files, and overwrite existing files
        rsync -a wordpress/ ./

        # Remove the wordpress folder and the zip file
        rm -rf wordpress latest.zip

        echo "Files moved to current directory and cleanup done."
    else
        echo "Extraction failed."
    fi
else
    echo "Download failed."
fi
