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
            url: "https://github.com/AFutureD/mmkv-spm/releases/download//MMKV.xcframework.zip",
            checksum: "2122b38add21663ea7345cec0ee394890f095d6196c45c92c519b7c795026c45"
        )
    ]
)
