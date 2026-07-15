// swift-tools-version: 6.2

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
        .package(
            url: "https://github.com/UlianaGritchina/AsyncCacheImage.git",
            from: "1.0.0"
        )
    ],
    targets: [
        .target(
            name: "MediaKit",
            dependencies: [
                .product(name: "DesignSystem", package: "DesignSystem"),
                .product(name: "AsyncCacheImage",  package: "AsyncCacheImage")
            ]
        ),

        .testTarget(
            name: "MediaKitTests",
            dependencies: ["MediaKit"]
        ),
    ]
)
