import Capacitor
import AVFoundation
import WebKit

@objc(WebViewConfiguratorPlugin)
public class WebViewConfiguratorPlugin: CAPPlugin, CAPBridgedPlugin {
    public let identifier = "WebViewConfiguratorPlugin"
    public let jsName = "WebViewConfigurator"
    
    public var pluginMethods: [CAPPluginMethod] = [
        CAPPluginMethod(name: "enableWebRTC", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "setJavaScriptEnabled", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "requestCameraAndMicAccess", returnType: CAPPluginReturnPromise),
    ]
    
    @objc func enableWebRTC(_ call: CAPPluginCall) {
        DispatchQueue.main.async {
            if let webView = self.webView {
                WebViewConfigurator.configureWebView(webView)
                call.resolve()
            } else {
                call.reject("WebView not available")
            }
        }
    }

    @objc func setJavaScriptEnabled(_ call: CAPPluginCall) {
        let enabled = call.getBool("enabled", true)

        DispatchQueue.main.async {
            guard let webView = self.webView else {
                call.reject("WebView not available")
                return
            }

            if #available(iOS 14.0, *) {
                let preferences = WKWebpagePreferences()
                preferences.allowsContentJavaScript = enabled
                let config = WKWebViewConfiguration()
                config.defaultWebpagePreferences = preferences

                let newWebView = WKWebView(frame: webView.frame, configuration: config)
                webView.removeFromSuperview()
                self.bridge?.viewController?.view.addSubview(newWebView)
            } else {
                webView.configuration.preferences.javaScriptEnabled = enabled
            }

            call.resolve()
        }
    }

    @objc func requestCameraAndMicAccess(_ call: CAPPluginCall) {
        let group = DispatchGroup()
        var cameraGranted = false
        var micGranted = false

        group.enter()
        AVCaptureDevice.requestAccess(for: .video) { granted in
            cameraGranted = granted
            group.leave()
        }

        group.enter()
        AVCaptureDevice.requestAccess(for: .audio) { granted in
            micGranted = granted
            group.leave()
        }

        group.notify(queue: .main) {
            if cameraGranted && micGranted {
                call.resolve(["granted": true])
            } else {
                call.reject("Camera or microphone access denied")
            }
        }
    }
}