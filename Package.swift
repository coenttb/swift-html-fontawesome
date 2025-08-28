// swift-tools-version: 6.0

import PackageDescription

extension String {
    static let htmlFontAwesome: Self = "HTMLFontAwesome"
}

extension Target.Dependency {
    static var htmlFontAwesome: Self { .target(name: .htmlFontAwesome) }
}

extension Target.Dependency {
    static var html: Self { .product(name: "HTML", package: "swift-html") }
}

let package = Package(
    name: "swift-html-fontawesome",
    platforms: [
        .macOS(.v14),
        .iOS(.v17),
        .tvOS(.v17),
        .watchOS(.v10),
        .macCatalyst(.v17),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: .htmlFontAwesome,
            targets: [.htmlFontAwesome]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/coenttb/swift-html", from: "0.0.1")
    ],
    targets: [
        .target(
            name: .htmlFontAwesome,
            dependencies: [
                .html
            ]
        ),
        .testTarget(
            name: .htmlFontAwesome.tests,
            dependencies: [
                .htmlFontAwesome
            ]
        )
    ],
    swiftLanguageModes: [.v6]
)

extension String {
    var tests: Self { "\(self) Tests" }
}
