// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ApodDomain",
    platforms: [
        .iOS(.v17),
        .macOS(.v15)
    ],
    products: [
        .library(
            name: "ApodDomain",
            targets: ["ApodDomain"]
        ),
    ],
    targets: [
        .target(
            name: "ApodDomain"
        ),
        .testTarget(
            name: "ApodDomainTests",
            dependencies: ["ApodDomain"]
        ),
    ]
)
