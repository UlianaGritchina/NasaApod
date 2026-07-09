// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MediaKit",
    platforms: [
        .iOS(.v17),
        .macOS(.v15)
    ],
    products: [
        .library(
            name: "MediaKit",
            targets: ["MediaKit"]
        ),
    ],
    dependencies: [
        .package(path: "../DesignSystem"),
    ],
    targets: [
        .target(
            name: "MediaKit",
            dependencies: [
                .product(name: "DesignSystem", package: "DesignSystem"),
            ]
        ),
        .testTarget(
            name: "MediaKitTests",
            dependencies: ["MediaKit"]
        ),
    ]
)
