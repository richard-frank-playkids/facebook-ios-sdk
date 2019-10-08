// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let SWIFT_PACKAGE = "SWIFT_PACKAGE"

let package = Package(
    name: "Facebook",
    platforms: [
        .iOS(.v8)
    ],
    products: [
        .library(
            name: "FBSDKCoreKit",
            targets: ["FBSDKCoreKit", "FacebookCore"]
        ),
        .library(
            name: "FBSDKLoginKit",
            targets: ["FBSDKLoginKit", "FacebookLogin"]
        ),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "FBSDKCoreKit",
            dependencies: [],
            path: "FBSDKCoreKit/FBSDKCoreKit",
            exclude: [
                "Internal/Device",
                "FBSDKDeviceViewControllerBase.m",
                "FBSDKDeviceButton.m",
                "Swift"
            ],
            cSettings: [
                .define(SWIFT_PACKAGE),
                .headerSearchPath("AppEvents"),
                .headerSearchPath("Basics/Internal"),
                .headerSearchPath("AppEvents/Internal/RestrictiveDataFilter"),
                .headerSearchPath("Internal"),
                .headerSearchPath("AppEvents/Internal"),
                .headerSearchPath("AppLink"),
                .headerSearchPath("Internal/Network"),
                .headerSearchPath("Internal/ServerConfiguration"),
                .headerSearchPath("AppEvents/Internal/Codeless"),
                .headerSearchPath("Internal/UI"),
                .headerSearchPath("Internal/TokenCaching"),
                .headerSearchPath("Internal/Instrument/CrashReport"),
                .headerSearchPath("Basics/Instrument"),
                .headerSearchPath("Internal/Instrument/ErrorReport"),
                .headerSearchPath("Internal/Cryptography"),
                .headerSearchPath("Internal/ErrorRecovery"),
                .headerSearchPath("Internal/Base64"),
                .headerSearchPath("Internal/BridgeAPI/ProtocolVersions"),
                .headerSearchPath("Internal/BridgeAPI"),
                .headerSearchPath("Internal/Instrument"),
                .headerSearchPath("AppLink/Internal"),
            ]
        ),
        .target(
            name: "FacebookCore",
            dependencies: ["FBSDKCoreKit"],
            path: "FBSDKCoreKit/FBSDKCoreKit/Swift"
        ),
        .target(
            name: "FBSDKLoginKit",
            dependencies: ["FBSDKCoreKit"],
            path: "FBSDKLoginKit/FBSDKLoginKit",
            exclude: [
                "Swift"
            ],
            cSettings: [
                .define(SWIFT_PACKAGE),
                .headerSearchPath("Internal"),
                .headerSearchPath("../../FBSDKCoreKit/FBSDKCoreKit/include"),
                .headerSearchPath("../../FBSDKCoreKit/FBSDKCoreKit/Internal"),
            ]
        ),
        .target(
            name: "FacebookLogin",
            dependencies: ["FBSDKLoginKit", "FacebookCore"],
            path: "FBSDKLoginKit/FBSDKLoginKit/Swift",
            cSettings: [
                .define(SWIFT_PACKAGE),
            ]
        ),
    ]
)
