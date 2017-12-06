# Samsung Motion Photo Video Extractor
BASH script solution to extract videos from motion photos introduced in Samsung Galaxy S7 &amp; S8 Phones

**Requirements** 

- BASH (Unix Shell)
- grep
- cut
- tail
    
> All these are available by default in Linux / OSX systems. In windows you can install MinGW or Cygwin which will contain all these tools as well

## Usage

### Without installation

    ./extractVideo_SamsungMotionPhoto.sh /path/to/pictures

### With Installation

This script can be installed if required as well. In Linux / OSX system, you can do the following

    # curl -o /usr/local/bin/extractVideo_SamsungMotionPhoto.sh https://raw.githubusercontent.com/starx/SamsungMotionPhotoVideoExtractor/master/extractVideo_SamsungMotionPhoto.sh
    # chmod +x /usr/local/bin/extractVideo_SamsungMotionPhoto.sh
    #

Then use, similarly

   extractVideo_SamsungMotionPhoto.sh /path/to/pictures

__Note:__ _If path is not specified it will read from current path_
