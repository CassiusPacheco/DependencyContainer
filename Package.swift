// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DependencyContainer",
    products: [
        .library(
            name: "DependencyContainer",
            targets: ["DependencyContainer"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "DependencyContainer",
            dependencies: []),
        .testTarget(
            name: "DependencyContainerTests",
            dependencies: ["DependencyContainer"]),
    ]
)
