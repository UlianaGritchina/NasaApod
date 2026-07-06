// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "APOD",
    platforms: [
        .iOS(.v17),
        .macOS(.v15)
    ],
    products: [
        .library(
            name: "APOD",
            targets: ["APOD"]
        ),
    ],
    dependencies: [
        .package(path: "../Core"),
        .package(path: "../Shared"),
        .package(path: "../DesignSystem"),
        .package(path: "../PhotosViewer")
    ],
    targets: [
        .target(
            name: "APOD",
            dependencies: [
                .product(name: "Core", package: "Core"),
                .product(name: "Shared", package: "Shared"),
                .product(name: "DesignSystem", package: "DesignSystem"),
                .product(name: "PhotosViewer", package: "PhotosViewer")
            ]
        ),
        .testTarget(
            name: "APODTests",
            dependencies: ["APOD"]
        )
    ]
)
