// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "LWFirstPod",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "LWFirstPod",
            targets: ["LWFirstPod"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ashleymills/Reachability.swift", from: "5.1.0")
    ],
    targets: [
        .target(
            name: "LWFirstPod",
            dependencies: [
                .product(name: "Reachability", package: "Reachability.swift")
            ],
            path: "LWFirstPod/Classes"
        ),
        .testTarget(
            name: "LWFirstPodTests",
            dependencies: ["LWFirstPod"],
            path: "Example/Tests",
            exclude: ["Info.plist"]
        ),
    ]
)
