// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "MacUIKitDemo",
    platforms: [
        .macOS(.v12)
    ],
    products: [
        .executable(
            name: "MacUIKitDemo",
            targets: ["MacUIKitDemo"]
        ),
    ],
    dependencies: [
        .package(name: "MacUIKit", path: "../..")
    ],
    targets: [
        .executableTarget(
            name: "MacUIKitDemo",
            dependencies: ["MacUIKit"],
            path: "Sources"
        ),
    ]
)
