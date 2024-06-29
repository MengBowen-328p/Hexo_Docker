#!/bin/bash
if [ "$(ls -A /app)" ]; then
    echo "***** App directory exists and has content, continuing *****";
else
    echo "***** App directory is empty, initialising with v2ray-core *****"
    # Install V2ray
    curl -O https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh
    chmod +x ./install-release.sh
    ./install-release.sh
    # Load our configs
    rm -rf /usr/local/etc/v2ray/config.json
    mv /config.json /usr/local/etc/v2ray/config.json
fi;
# Start v2ray
/usr/local/bin/v2ray run -c /usr/local/etc/v2ray/config.json
