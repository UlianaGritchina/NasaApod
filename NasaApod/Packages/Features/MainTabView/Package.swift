// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MainTabView",
    platforms: [
        .iOS(.v17),
        .macOS(.v15)
    ],
    products: [
        .library(
            name: "MainTabView",
            targets: ["MainTabView"]
        ),
    ],
    dependencies: [
        .package(path: "../APOD"),
        .package(path: "../Core"),
        .package(path: "../DesignSystem"),
    ],
    targets: [
        .target(
            name: "MainTabView",
            dependencies: [
                .product(name: "APOD", package: "APOD"),
                .product(name: "Core", package: "Core"),
                .product(name: "DesignSystem", package: "DesignSystem"),
            ]
        ),
        .testTarget(
            name: "MainTabViewTests",
            dependencies: ["MainTabView"]
        ),
    ]
)
