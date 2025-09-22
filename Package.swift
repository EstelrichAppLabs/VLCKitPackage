// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "VLCKit",
    platforms: [.iOS(.v17), .tvOS(.v17)],
    products: [.library(name: "VLCKit", targets: ["VLCKitBridge"])],
    targets: [
        .binaryTarget(
            name: "MobileVLCKit",
            url: "https://github.com/EstelrichAppLabs/VLCKitPackage/releases/download/2025.9.3/MobileVLCKit_v361b1.xcframework.zip",
            checksum: "f22ec82dcf2e5b6cc6819cc787767561d9eed8281df68679f05d598f53ead5a6"
        ),
        .binaryTarget(
            name: "TVVLCKit",
            url: "https://github.com/EstelrichAppLabs/VLCKitPackage/releases/download/2025.9.3/TVVLCKit_v361b1.xcframework.zip",
            checksum: "f4b1a3dcee5a4144cb7050cf31d4243a293d97a674f39ff6d4bf534ac8942825"
        ),
        .binaryTarget(
            name: "VLCKitBinary",
            url: "https://github.com/EstelrichAppLabs/VLCKitPackage/releases/download/2025.9.3/VLCKit_v400a16.xcframework.zip",
            checksum: "01c9e647e6dea078e7586242fe23020e5a505e73ca312eac813d0d8198c9dd03"
        ),
        .target(
            name: "VLCKitBridge",
            dependencies: [
                .target(name: "MobileVLCKit", condition: .when(platforms: [.iOS])),
                .target(name: "TVVLCKit", condition: .when(platforms: [.tvOS])),
                "VLCKitBinary"
            ],
            path: "Sources/VLCKit"
        )
    ]
)
