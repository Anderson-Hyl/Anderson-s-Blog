// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Anderson-s-Blog",
		platforms: [
			.iOS(.v17),
			.macOS(.v15)
		],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Anderson-s-Blog",
            targets: ["Anderson-s-Blog"]),
    ],
		dependencies: [
			.package(
				url: "https://github.com/pointfreeco/swift-snapshot-testing",
				from: "1.12.0"
			),
		],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
					name: "Anderson-s-Blog",
				),
        .testTarget(
            name: "Anderson-s-BlogTests",
						dependencies: [
							"Anderson-s-Blog",
							.product(
								name: "SnapshotTesting",
								package: "swift-snapshot-testing"
							)
						]
        ),
    ]
)
