// swift-tools-version:5.1
import PackageDescription

let package = Package(
	name: "SwiftTools",
	platforms: [.macOS(.v10_11)],
	dependencies: [
		.package(url: "https://github.com/nicklockwood/SwiftFormat", from: "0.53.1"),
		.package(url: "https://github.com/realm/SwiftLint", from: "0.54.0"),
		.package(url: "https://github.com/mac-cain13/R.swift", from: "7.4.0")
	],
	targets: [.target(name: "SwiftTools", path: "")]
)
