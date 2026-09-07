// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-successor",
    platforms: [
        .macOS(.v27), .iOS(.v27), .tvOS(.v27), .watchOS(.v27), .visionOS(.v27),
    ],
    products: [
        .library(name: "Successor", targets: ["Successor"]),
        .library(name: "Successor Standard Library Integration", targets: ["Successor Standard Library Integration"]),
        .library(name: "Successor Foundation Library Integration", targets: ["Successor Foundation Library Integration"]),
        .library(name: "Successor Test Support", targets: ["Successor Test Support"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-atoms/swift-addition.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "Successor",
            dependencies: [
                .product(name: "Addition", package: "swift-addition"),
            ],
            path: "Sources/Successor"
        ),
        .target(
            name: "Successor Standard Library Integration",
            dependencies: [
                .target(name: "Successor"),
            ],
            path: "Sources/Successor Standard Library Integration"
        ),
        .target(
            name: "Successor Foundation Library Integration",
            dependencies: [
                .target(name: "Successor"),
                .target(name: "Successor Standard Library Integration"),
            ],
            path: "Sources/Successor Foundation Library Integration"
        ),
        .target(
            name: "Successor Test Support",
            dependencies: [
                .target(name: "Successor"),
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Successor Tests",
            dependencies: [
                .target(name: "Successor"),
                .product(name: "Addition", package: "swift-addition"),
                .target(name: "Successor Test Support"),
                .target(name: "Successor Standard Library Integration"),
                .target(name: "Successor Foundation Library Integration"),
            ],
            path: "Tests/Successor Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets {
    target.swiftSettings = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]
}
