// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AoC",
    dependencies: [
    ],
    targets: [
        .target(
            name: "AoC",
            dependencies: ["AoCKit"],
            exclude: ["config.swift.secret"]),
        .target(
            name: "AoCKit",
            dependencies: [
                .package(url: "https://github.com/apple/swift-algorithms", from: "1.0.0")
            ]),
        .testTarget(
            name: "AoCKitTests",
            dependencies: ["AoCKit"])
    ]
)
