// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package( name: "PromptPay",
                  platforms: [.macOS(.v13), .iOS(.v16)],
                   products: [.library(name: "PromptPay",
                                       targets: ["PromptPay"])],
               dependencies: [.package(url: "https://github.com/ivanesik/CrcSwift.git",
                                       branch: "master")],
                    targets: [.target(name: "PromptPay", dependencies: ["CrcSwift"]),
                              .testTarget(name: "PromptPayTests",
                                  dependencies: ["PromptPay"])])

