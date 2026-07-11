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
        .package(path: "../AppFoundation"),
        .package(path: "../DesignSystem"),
        .package(path: "../MediaKit"),
        .package(path: "../Explore"),
        .package(path: "../ApodData"),
        .package(path: "../ApodDomain")
    ],
    targets: [
        .target(
            name: "APOD",
            dependencies: [
                .product(name: "Core", package: "Core"),
                .product(name: "AppFoundation", package: "AppFoundation"),
                .product(name: "DesignSystem", package: "DesignSystem"),
                .product(name: "MediaKit", package: "MediaKit"),
                .product(name: "Explore", package: "Explore"),
                .product(name: "ApodData", package: "ApodData"),
                .product(name: "ApodDomain", package: "ApodDomain")
            ]
        ),
        .testTarget(
            name: "APODTests",
            dependencies: ["APOD"]
        )
    ]
)
