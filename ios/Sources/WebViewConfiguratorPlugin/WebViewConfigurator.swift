import Foundation

@objc public class WebViewConfigurator: NSObject {
    @objc public func echo(_ value: String) -> String {
        print(value)
        return value
    }
}
