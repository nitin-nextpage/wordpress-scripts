#!/bin/bash

# Download the latest version of WordPress
wget https://wordpress.org/latest.zip

# Check if the download was successful
if [ $? -eq 0 ]; then
    echo "Download successful."

    # Extract the downloaded zip file
    unzip latest.zip

    # Check if the extraction was successful
    if [ $? -eq 0 ]; then
        echo "Extraction successful."

        # Move the contents of the wordpress folder to the current directory, including dot files
        shopt -s dotglob nullglob
        mv wordpress/* ./

        # Remove the wordpress folder and the zip file
        rm -rf wordpress latest.zip

        echo "Files moved to current directory and cleanup done."
    else
        echo "Extraction failed."
    fi
else
    echo "Download failed."
fi
