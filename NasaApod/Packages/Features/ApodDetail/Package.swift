// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ApodDetail",
    platforms: [
        .iOS(.v17),
        .macOS(.v15)
    ],
    products: [
        .library(
            name: "ApodDetail",
            targets: ["ApodDetail"]
        ),
    ],
    dependencies: [
        .package(path: "../ApodDomain"),
        .package(path: "../DesignSystem"),
        .package(path: "../MediaKit")
    ],
    targets: [
        .target(
            name: "ApodDetail",
            dependencies: [
                .product(name: "ApodDomain", package: "ApodDomain"),
                .product(name: "DesignSystem", package: "DesignSystem"),
                .product(name: "MediaKit", package: "MediaKit")
            ]
        ),
        .testTarget(
            name: "ApodDetailTests",
            dependencies: ["ApodDetail"]
        ),
    ]
)
