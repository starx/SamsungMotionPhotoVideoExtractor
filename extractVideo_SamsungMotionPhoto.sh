#!/bin/bash

# Copyright 2017 Starx (Nabin Nepal)
#
# Licensed under the GNU Lesser General Public License v3.0
#
# Permissions of this copyleft license are conditioned on making 
# available complete source code of licensed works and modifications 
# under the same license or the GNU GPLv3. Copyright and license 
# notices must be preserved. Contributors provide an express grant 
# of patent rights. However, a larger work using the licensed work 
# through interfaces provided by the licensed work may be distributed
# under different terms and without source code for the larger work.
#
# ----------
# Extracts the MP4 video from Motion Photos available on the samsung
# Galaxy S7 or S8 phones. It can work with any environment that has
# BASH. Uses grep, cut, tail to extract the video. 
#
# Example usage: extractVideo_SamsungMotionPhoto.sh /path/to/pictures


# Function definition
function extractVideo_SamsungMotionPhoto {

	# Text in the file which separates the video
	SEPARATOR="MotionPhoto_Data"
	# The position from which, extraction should commence
	SEPARATOR_OFFSET=$((${#SEPARATOR} + 1))

	# If path not specified, take current directory 
	SEARCH_PATH=${1:-$PWD}

	# Search all jpg in a path
	for FILE_PATH in `find $SEARCH_PATH -type f -iregex ".*\.jpg.*"`; do
		echo "Attempting to extract video from $FILE_PATH."

		# Directory
		FILE_DIRECTORY=$(dirname $FILE_PATH)

		# Extract the filename
		FILE_NAME=$(echo `basename $FILE_PATH` | cut -f 1 -d '.')

		# Extract the position in the image file, from where video starts
		VIDEO_OFFSET=`grep -abo $SEPARATOR $FILE_PATH | cut -d: -f1`

		# If offset is empty, video does not exists
		if [ -z "$VIDEO_OFFSET" ]; then
			echo "Video not found. Skipping."
		else
			# Generate a full path of destination file
			DESTINATION_FILE="$FILE_DIRECTORY/$FILE_NAME.mp4"
			# Extract the remainder of the file from image and save it as a mp4 file
			tail -c +$(($VIDEO_OFFSET + $SEPARATOR_OFFSET)) $FILE_PATH > $DESTINATION_FILE
			echo "Video found. Extracting to $DESTINATION_FILE"
		fi
		echo
		echo

	done
}

#Usage
extractVideo_SamsungMotionPhoto "$@"
