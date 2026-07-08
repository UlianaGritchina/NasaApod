// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Explore",
    platforms: [
        .iOS(.v17),
        .macOS(.v15)
    ],
    products: [
        
        .library(
            name: "Explore",
            targets: ["Explore"]
        ),
    ],
    dependencies: [
        .package(path: "../Core"),
        .package(path: "../AppFoundation"),
        .package(path: "../DesignSystem"),
        .package(path: "../PhotosViewer"),
        .package(path: "../NasaModels")
    ],
    targets: [
        .target(
            name: "Explore",
            dependencies: [
                .product(name: "Core", package: "Core"),
                .product(name: "AppFoundation", package: "AppFoundation"),
                .product(name: "DesignSystem", package: "DesignSystem"),
                .product(name: "PhotosViewer", package: "PhotosViewer"),
                .product(name: "NasaModels", package: "NasaModels")
            ]
        ),
        .testTarget(
            name: "ExploreTests",
            dependencies: ["Explore"]
        ),
    ]
)
