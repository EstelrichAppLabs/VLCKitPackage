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
            url: "https://github.com/EstelrichAppLabs/VLCKitPackage/releases/download/3.6.0/MobileVLCKit.xcframework.zip",
            checksum: "5cd1737ab6c557f4673934cd31803daedabbe18b13b6a5404ecf629616c363f7"
        ),
        .binaryTarget(
            name: "TVVLCKit",
            url: "https://github.com/EstelrichAppLabs/VLCKitPackage/releases/download/3.6.0/TVVLCKit.xcframework.zip",
            checksum: "5c3169e59f9cce4ba4d6c8b36c51c93c13d6cf0e48d11344efb64bb909e35c6a"
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
