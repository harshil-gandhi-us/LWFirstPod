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
        // Dependencies declare other packages that this package depends on.
    ],
    targets: [
        .target(
            name: "LWFirstPod",
            dependencies: [],
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
