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
            checksum: "59d688959ee93134a1065dff09bec3896f0007b76fd2ce7d2fb6192d15e508c5"
        )
    ]
)
