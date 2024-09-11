// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MMKV",
    platforms: [
        .iOS(.v16),
        .macOS(.v13),
        .tvOS(.v16),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "MMKV",
            targets: ["MMKV"]),
    ],
    targets: [
        .binaryTarget(
            name: "MMKV",
            url: "https://github.com/devjia/mmkv-spm/releases/download/v1.3.9/MMKV.xcframework.zip",
            checksum: "1eea93ef3dafddc9247e5f9e8fd373d3d4e54e5d04a444111352b4334f7ae097"
        )
    ]
)
