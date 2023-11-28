#!/bin/bash

VERSION=$(date +%y%m%d)

echo ${VERSION} > VERSION

podman build --no-cache -t quay.io/wcaban/net-toolbox:latest -f Containerfile
podman tag quay.io/wcaban/net-toolbox:latest quay.io/wcaban/net-toolbox:${VERSION}

