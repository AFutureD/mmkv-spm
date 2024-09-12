// swift-tools-version:5.10
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
            url: "https://github.com/AFutureD/mmkv-spm/releases/download/1.3.9/MMKV.xcframework.zip",
            checksum: "a3358b187edf26919346fc2163c84ad43018232c0fbe455b098b7db59f20a421"
        )
    ]
)
