 #!/usr/bin/env bash

 # Execute this file to install the cryptomiles cli tools into your path on OS X

 CURRENT_LOC="$( cd "$(dirname "$0")" ; pwd -P )"
 LOCATION=${CURRENT_LOC%Cryptomiles-Qt.app*}

 # Ensure that the directory to symlink to exists
 sudo mkdir -p /usr/local/bin

 # Create symlinks to the cli tools
 sudo ln -s ${LOCATION}/Cryptomiles-Qt.app/Contents/MacOS/cryptomilesd /usr/local/bin/cryptomilesd
 sudo ln -s ${LOCATION}/Cryptomiles-Qt.app/Contents/MacOS/cryptomiles-cli /usr/local/bin/cryptomiles-cli
