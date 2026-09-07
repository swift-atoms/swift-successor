// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-successor",
    platforms: [
        .macOS(.v27), .iOS(.v27), .tvOS(.v27), .watchOS(.v27), .visionOS(.v27),
    ],
    products: [
        .library(name: "Successor", targets: ["Successor"]),

        .library(name: "Successor Foundation Integration", targets: ["Successor Foundation Integration"]),
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
            name: "Successor Foundation Integration",
            dependencies: [
                .target(name: "Successor"),
            ],
            path: "Sources/Successor Foundation Integration"
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
                .target(name: "Successor Foundation Integration"),
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
