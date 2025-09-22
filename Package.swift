// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Foundation

// MARK: - VLCKitVersion

enum VLCKitVersion: String {

    case v3_6_1 = "3.6.1"
    case v4_0_0 = "4.0.0"

    static var current: VLCKitVersion {
        let value = ProcessInfo.processInfo.environment["VLCKIT_VERSION"] ?? "4.0.0"
        return VLCKitVersion(rawValue: value) ?? .v4_0_0
    }
}

// MARK: - Package

switch VLCKitVersion.current {
case .v3_6_1:
    let package = Package(
        name: "VLCKit",
        platforms: [.iOS(.v17), .tvOS(.v17)],
        products: [.library(name: "VLCKit", targets: ["VLCKitBridge"])],
        targets: [
            .binaryTarget(
                name: "MobileVLCKit",
                url: "https://github.com/EstelrichAppLabs/VLCKitPackage/releases/download/2025.7.0/MobileVLCKit.xcframework.zip",
                checksum: "f22ec82dcf2e5b6cc6819cc787767561d9eed8281df68679f05d598f53ead5a6"
            ),
            .binaryTarget(
                name: "TVVLCKit",
                url: "https://github.com/EstelrichAppLabs/VLCKitPackage/releases/download/2025.7.0/TVVLCKit.xcframework.zip",
                checksum: "f4b1a3dcee5a4144cb7050cf31d4243a293d97a674f39ff6d4bf534ac8942825"
            ),
            .target(
                name: "VLCKitBridge",
                dependencies: [
                    .target(name: "MobileVLCKit", condition: .when(platforms: [.iOS])),
                    .target(name: "TVVLCKit", condition: .when(platforms: [.tvOS]))
                ],
                path: "Sources/VLCKit",
                swiftSettings: [.define("VLCKIT_LEGACY")]
            )
        ]
    )
default:
    let package = Package(
        name: "VLCKit",
        platforms: [.iOS(.v17), .tvOS(.v17)],
        products: [.library(name: "VLCKit", targets: ["VLCKitBridge"])],
        targets: [
            .binaryTarget(
                name: "VLCKitBinary",
                url: "https://github.com/EstelrichAppLabs/VLCKitPackage/releases/download/2025.9.0/VLCKit.xcframework.zip",
                checksum: "01c9e647e6dea078e7586242fe23020e5a505e73ca312eac813d0d8198c9dd03"
            ),
            .target(
                name: "VLCKitBridge",
                dependencies: ["VLCKitBinary"],
                path: "Sources/VLCKit"
            )
        ]
    )
}
