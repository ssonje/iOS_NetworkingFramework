// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NetworkingFramework",
    platforms: [
        .iOS(.v12),
        .macOS(.v10_15)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "NetworkingFramework",
            targets: ["NetworkingFramework"]),
    ],
    targets: [
        .binaryTarget(
            name: "NetworkingFramework",
            path: "./build/NetworkingFramework.xcframework"
        ),
    ]
)
