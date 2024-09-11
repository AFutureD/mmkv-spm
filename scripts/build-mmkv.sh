#!/bin/zsh

set -e

BUILD_TAG=$1
MMKV_REPO_DIR=$2
MMKV_XC_MANIFEST_NAME=$3

echo "BUILD_TAG: $BUILD_TAG"
echo "MMKV_REPO_DIR: $MMKV_REPO_DIR"
echo "MMKV_XC_MANIFEST_NAME: $MMKV_XC_MANIFEST_NAME"

echo "---------------------------------"
echo  "ls $(ls -la)"
echo "---------------------------------"

pushd "$MMKV_REPO_DIR" > /dev/null
echo "[*] Changed to $MMKV_REPO_DIR $PWD"

rm -rf archives
xcodebuild archive \
    -workspace MMKV.xcworkspace \
    -scheme MMKV \
    -configuration Release \
    -destination "generic/platform=iOS" \
    -archivePath "archives/MMKV-iOS" \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
    >/dev/null 2>&1
echo "[*] MMKV-iOS.xcarchive created"

# xcodebuild archive \
#     -workspace MMKV.xcworkspace \
#     -scheme MMKV \
#     -configuration Release \
#     -destination "generic/platform=iOS Simulator" \
#     -archivePath "archives/MMKV-iOS-Simulator" \
#     SKIP_INSTALL=NO \
#     BUILD_LIBRARY_FOR_DISTRIBUTION=YES

# xcodebuild archive \
#     -workspace MMKV.xcworkspace \
#     -scheme MMKV \
#     -configuration Release \
#     -destination "generic/platform=tvOS" \
#     -archivePath "archives/MMKV-tvOS" \
#     SKIP_INSTALL=NO \
#     BUILD_LIBRARY_FOR_DISTRIBUTION=YES

# xcodebuild archive \
#     -workspace MMKV.xcworkspace \
#     -scheme MMKV \
#     -configuration Release \
#     -destination "generic/platform=macOS" \
#     -archivePath "archives/MMKV-macOS" \
#     SKIP_INSTALL=NO \
#     BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild \
    -create-xcframework \
    -archive archives/MMKV-iOS.xcarchive -framework MMKV.framework \
    -output archives/MMKV.xcframework
    
    # -archive archives/MMKV-iOS-Simulator.xcarchive -framework MMKV.framework \
    # -archive archives/MMKV-tvOS.xcarchive -framework MMKV.framework \
    # -archive archives/MMKV-macOS.xcarchive -framework MMKV.framework \
    

echo "[*] MMKV.xcframework created"

zip -r -X "archives/$MMKV_XC_MANIFEST_NAME" "archives/MMKV.xcframework"
ehoc "[*] $MMKV_XC_MANIFEST_NAME created"

mv "archives/$MMKV_XC_MANIFEST_NAME" "/tmp/$MMKV_XC_MANIFEST_NAME"
ehoc "[*] $MMKV_XC_MANIFEST_NAME moved to /tmp/$MMKV_XC_MANIFEST_NAME"

popd > /dev/null
echo "[*] Back to the root directory $PWD"

git clean -fdx -f
git reset --hard
echo "[*] Cleaned up the repo"

mv "/tmp/$MMKV_XC_MANIFEST_NAME" "./$MMKV_XC_MANIFEST_NAME"
echo "[*] Moved $MMKV_XC_MANIFEST_NAME to the root directory"

