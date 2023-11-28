#!/bin/bash

VERSION=$(cat VERSION)

podman push quay.io/wcaban/net-toolbox:latest
podman push quay.io/wcaban/net-toolbox:${VERSION}
