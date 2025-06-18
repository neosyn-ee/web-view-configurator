import Foundation
import WebKit

public class WebViewConfigurator: NSObject  {
    public static func configureWebView(_ webView: WKWebView) {
        let config = webView.configuration
        
        if #available(iOS 14.0, *) {
            let webpagePreferences = WKWebpagePreferences()
            webpagePreferences.allowsContentJavaScript = true
            config.defaultWebpagePreferences = webpagePreferences
        } else {
            config.preferences.javaScriptEnabled = true
        }

        config.preferences.setValue(true, forKey: "allowFileAccessFromFileURLs")
        config.allowsInlineMediaPlayback = true

        if #available(iOS 10.0, *) {
            config.mediaTypesRequiringUserActionForPlayback = []
        }
    }
}