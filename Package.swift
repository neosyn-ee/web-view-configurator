// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "NeosynEeWebViewConfigurator",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "NeosynEeWebViewConfigurator",
            targets: ["WebViewConfiguratorPlugin"])
    ],
    dependencies: [
        .package(url: "https://github.com/ionic-team/capacitor-swift-pm.git", from: "7.0.0")
    ],
    targets: [
        .target(
            name: "WebViewConfiguratorPlugin",
            dependencies: [
                .product(name: "Capacitor", package: "capacitor-swift-pm"),
                .product(name: "Cordova", package: "capacitor-swift-pm")
            ],
            path: "ios/Sources/WebViewConfiguratorPlugin"),
        .testTarget(
            name: "WebViewConfiguratorPluginTests",
            dependencies: ["WebViewConfiguratorPlugin"],
            path: "ios/Tests/WebViewConfiguratorPluginTests")
    ]
)
