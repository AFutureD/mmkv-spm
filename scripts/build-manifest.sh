#!/bin/bash

set -e

RELEASE_TAG=$1
MMKV_XC_MANIFEST_NAME=$2
DOWNLOAD_URL=$3

SHA256SUM=$(shasum -a 256 "$MMKV_XC_MANIFEST_NAME" | awk '{print $1}')

rm -rf Package.swift

PACKAGE_MANIFEST=$(cat Package.swift.template)
PACKAGE_MANIFEST=${PACKAGE_MANIFEST/__DOWNLOAD_URL__/$DOWNLOAD_URL}
PACKAGE_MANIFEST=${PACKAGE_MANIFEST/__CHECKSUM__/$SHA256SUM}

echo "$PACKAGE_MANIFEST" > Package.swift

cat Package.swift

echo "[*] done $(basename $0)"
