// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package( name: "PromptPayCode",
                  platforms: [.macOS(.v13), .iOS(.v15)],
                   products: [.library(name: "PromptPayCode",
                                       targets: ["PromptPayCode"])],
                    targets: [.target(name: "PromptPayCode"),
                              .testTarget(name: "PromptPayCodeTests",
                                  dependencies: ["PromptPayCode"])])
