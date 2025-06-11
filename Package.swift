// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "VLCKit",
    platforms: [.iOS(.v17), .tvOS(.v17)],
    products: [.library(name: "VLCKit", targets: ["VLCKit"])],
    targets: [
        .binaryTarget(
            name: "MobileVLCKit",
            url: "https://github.com/EstelrichAppLabs/VLCKitPackage/releases/download/3.6.1/MobileVLCKit.xcframework.zip",
            checksum: "f22ec82dcf2e5b6cc6819cc787767561d9eed8281df68679f05d598f53ead5a6"
        ),
        .binaryTarget(
            name: "TVVLCKit",
            url: "https://github.com/EstelrichAppLabs/VLCKitPackage/releases/download/3.6.1/TVVLCKit.xcframework.zip",
            checksum: "f4b1a3dcee5a4144cb7050cf31d4243a293d97a674f39ff6d4bf534ac8942825"
        ),
        .target(
            name: "VLCKit",
            dependencies: [
                .target(name: "MobileVLCKit", condition: .when(platforms: [.iOS])),
                .target(name: "TVVLCKit", condition: .when(platforms: [.tvOS]))
            ],
            path: "Sources/VLCKit"
        )
    ]
)
