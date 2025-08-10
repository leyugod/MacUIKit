// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MacUIKit",
    platforms: [
        .macOS(.v12)
    ],
    products: [
        // MacUIKit库 - 完整的MacOS UI组件库
        .library(
            name: "MacUIKit",
            targets: ["MacUIKit"]
        ),
    ],
    dependencies: [
        // 目前不需要外部依赖，保持轻量级
    ],
    targets: [
        // MacUIKit主目标 - 包含所有UI组件
        .target(
            name: "MacUIKit",
            dependencies: [],
            path: "Sources/MacUIKit",
            resources: [
                .process("Resources")
            ]
        ),
        
        // 单元测试目标
        .testTarget(
            name: "MacUIKitTests",
            dependencies: ["MacUIKit"],
            path: "Tests/MacUIKitTests"
        ),
        
        // UI测试目标
        .testTarget(
            name: "MacUIKitUITests",
            dependencies: ["MacUIKit"],
            path: "Tests/MacUIKitUITests"
        ),
    ]
)
