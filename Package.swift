// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "TagBarLib",
    platforms: [ // make this iOS only?
        // remove macOS support?
        .macOS(.v14), // macOS 14 and later (Sonoma)
        .iOS(.v17) // iOS 17 and later
    ],
    products: [
        .library(
            name: "TagBarLib",
            targets: ["TagBarLib"]) // Defines the library product for TagBarLib
    ],
    dependencies: [
      .package(url: "https://github.com/sentryco/HybridColor", branch: "main") // Dependency for HybridColor
    ],
    targets: [
        .target(
            name: "TagBarLib",
            dependencies: [
               .product(name: "HybridColor", package: "HybridColor") // Dependency for HybridColor
            ]
        ),
        .testTarget(
            name: "TagBarLibTests",
            dependencies: ["TagBarLib"]) // Test target for TagBarLib
    ]
)
