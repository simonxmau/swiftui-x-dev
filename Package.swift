// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-x-dev",
    platforms: [
        .iOS(.v16),
        .macOS(.v14),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SwiftXDev",
            targets: ["SwiftXDev"]
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SwiftXDev"
        ),
        .testTarget(
            name: "SwiftXDevTests",
            dependencies: ["SwiftXDev"]
        ),
    ]
)
