// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let cxxSettings: [CXXSetting] = [
	.define("CLANG_CXX_LANGUAGE_STANDARD", to: CXXLanguageStandard.cxx11.rawValue),
	.define("CLANG_CXX_LIBRARY", to: "libc++"),
	.define("GCC_ENABLE_OBJC_EXCEPTIONS", to: "NO"),
	.define("OTHER_CPLUSPLUSFLAGS", to: "-fno-exceptions"),
]

let package = Package(
	name: "ZipZap",
	defaultLocalization: "en",
	platforms: [
		.iOS(.v12),
		.macOS(.v10_13),
		.tvOS(.v12),
		.watchOS(.v4)
	],
	products: [
		// Products define the executables and libraries a package produces, making them visible to other packages.
		.library(
			name: "ZipZap",
			targets: ["ZipZap"]),
	],
	dependencies: [
		// no dependencies
	],
	targets: [
		// Targets are the basic building blocks of a package, defining a module or a test suite.
		// Targets can depend on other targets in this package and products from dependencies.
		.target(
			name: "ZipZap",
			path: "ZipZap",
			publicHeadersPath: "./",
			cxxSettings: cxxSettings,
			linkerSettings: [
				.linkedLibrary("z")
			]),
		.testTarget(
			name: "ZipZapTests",
			dependencies: ["ZipZap"],
			path: "ZipZapTests"),
	]
)
