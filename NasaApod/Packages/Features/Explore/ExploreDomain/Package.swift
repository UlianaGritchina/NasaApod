// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ExploreDomain",
    platforms: [
        .iOS(.v17),
        .macOS(.v15)
    ],
    products: [
        .library(
            name: "ExploreDomain",
            targets: ["ExploreDomain"]
        ),
    ],
    dependencies: [
        .package(path: "../ApodDomain"),
    ],
    targets: [
        .target(
            name: "ExploreDomain",
            dependencies: [
                .product(name: "ApodDomain", package: "ApodDomain")
            ]
        ),
        .testTarget(
            name: "ExploreDomainTests",
            dependencies: ["ExploreDomain"]
        ),
    ]
)
