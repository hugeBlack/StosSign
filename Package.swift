// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "StosSign",
    platforms: [
        .iOS(.v14),
        .macOS(.v11),
    ],
    products: [
        .library(
            name: "StosSign_API_NoCertificate",
            targets: ["StosSign_API_NoCertificate"]
        ),
        .library(
            name: "StosSign_Auth",
            targets: ["StosSign_Auth"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-crypto.git", "1.0.0" ..< "5.0.0"),
        .package(url: "https://github.com/adam-fowler/swift-srp.git", revision: "ce202c48f8ca68f44b71732f945eb8221d6fe135"),
        .package(url: "https://github.com/krzyzanowskim/CryptoSwift", from: "1.9.0")
    ],
    targets: [
        .target(
            name: "StosSign_API_NoCertificate",
            dependencies: []
        ),
        .target(
            name: "StosSign_Auth",
            dependencies: [
                .product(name: "Crypto", package: "swift-crypto"),
                .product(name: "CryptoSwift", package: "CryptoSwift"),
                .product(name: "SRP", package: "swift-srp"),
                "StosSign_API_NoCertificate",
            ]
        ),
    ],
    cLanguageStandard: .gnu11,
    cxxLanguageStandard: .cxx14
)
