// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ApodData",
    platforms: [
        .iOS(.v17),
        .macOS(.v15)
    ],
    products: [
        .library(
            name: "ApodData",
            targets: ["ApodData"]
        ),
    ],
    dependencies: [
        .package(path: "../ApodDomain"),
        .package(path: "../DependencyContainer"),
    ],
    targets: [
        .target(
            name: "ApodData",
            dependencies: [
                .product(name: "ApodDomain", package: "ApodDomain"),
                .product(name: "DependencyContainer", package: "DependencyContainer")
            ]
        ),
        .testTarget(
            name: "ApodDataTests",
            dependencies: ["ApodData"]
        ),
    ]
)
