// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "KognitaModels",
    products: [
        .library(
            name: "KognitaModels",
            targets: ["KognitaModels"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "KognitaModels",
            dependencies: [])
    ]
)
