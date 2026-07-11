// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ExploreData",
    platforms: [
        .iOS(.v17),
        .macOS(.v15)
    ],
    products: [
        .library(
            name: "ExploreData",
            targets: ["ExploreData"]
        ),
    ],
    dependencies: [
        .package(path: "../ApodDomain"),
        .package(path: "../ApodData"),
        .package(path: "../DependencyContainer"),
        .package(path: "../Core"),
        .package(path: "../ExploreDomain")
    ],
    targets: [
        .target(
            name: "ExploreData",
            dependencies: [
                .product(name: "ApodDomain", package: "ApodDomain"),
                .product(name: "ApodData", package: "ApodData"),
                .product(name: "DependencyContainer", package: "DependencyContainer"),
                .product(name: "Core", package: "Core"),
                .product(name: "ExploreDomain", package: "ExploreDomain")
            ]
        ),
        .testTarget(
            name: "ExploreDataTests",
            dependencies: ["ExploreData"]
        ),
    ]
)
