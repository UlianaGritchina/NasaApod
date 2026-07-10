// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DependencyContainer",
    platforms: [
        .iOS(.v17),
        .macOS(.v15)
    ],
    products: [
        .library(
            name: "DependencyContainer",
            targets: ["DependencyContainer"]
        ),
    ],
    targets: [
        .target(
            name: "DependencyContainer"
        ),
        .testTarget(
            name: "DependencyContainerTests",
            dependencies: ["DependencyContainer"]
        ),
    ]
)
