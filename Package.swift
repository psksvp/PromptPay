// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package( name: "PromptPayCode",
                  platforms: [.macOS(.v13), .iOS(.v16)],
                   products: [.library(name: "PromptPayCode",
                                       targets: ["PromptPayCode"])],
               dependencies: [.package(url: "https://github.com/ivanesik/CrcSwift.git", branch: "master")],
                    targets: [.target(name: "PromptPayCode", dependencies: ["CrcSwift"]),
                              .testTarget(name: "PromptPayCodeTests",
                                  dependencies: ["PromptPayCode"])])

