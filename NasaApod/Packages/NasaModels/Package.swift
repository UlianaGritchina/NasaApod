// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NasaModels",
    platforms: [
        .iOS(.v17),
        .macOS(.v15)
    ],
    products: [
        .library(
            name: "NasaModels",
            targets: ["NasaModels"]
        ),
    ],
    dependencies: [
        .package(path: "../AppFoundation")
    ],
    targets: [
        .target(
            name: "NasaModels",
            dependencies: [
                .product(name: "AppFoundation", package: "AppFoundation")
            ]
        ),
        .testTarget(
            name: "NasaModelsTests",
            dependencies: ["NasaModels"]
        ),
    ]
)
