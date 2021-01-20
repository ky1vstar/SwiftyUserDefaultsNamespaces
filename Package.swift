// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftyUserDefaults+Namespaces",
    platforms: [
        .macOS(.v10_11), .iOS(.v9), .tvOS(.v9), .watchOS(.v2)
    ],
    products: [
        .library(
            name: "SwiftyUserDefaults+Namespaces",
            targets: ["SwiftyUserDefaults+Namespaces"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/sunshinejr/SwiftyUserDefaults.git",
            .upToNextMajor(from: "5.0.0")
        ),
    ],
    targets: [
        .target(
            name: "SwiftyUserDefaults+Namespaces",
            dependencies: ["SwiftyUserDefaults"]
        ),
        .testTarget(
            name: "SwiftyUserDefaults+NamespacesTests",
            dependencies: ["SwiftyUserDefaults+Namespaces"]
        ),
    ]
)
