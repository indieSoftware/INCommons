// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "INCommons",
    platforms: [.iOS("16.0")],
    products: [
        .library(
            name: "INCommons",
            targets: ["INCommons"]
		),
    ],
    dependencies: [
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "INCommons",
            dependencies: []
		),
        .testTarget(
            name: "INCommonsTests",
            dependencies: ["INCommons"]
		),
    ]
)
