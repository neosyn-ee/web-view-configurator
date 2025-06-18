package com.neosyn.plugins.webviewconfigurator;

import android.os.Handler;
import android.os.Looper;
import android.webkit.WebView;

import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;

@CapacitorPlugin(name = "WebViewConfigurator")
public class WebViewConfiguratorPlugin extends Plugin {

    @PluginMethod
    public void setJavaScriptEnabled(final PluginCall call) {
        boolean enabled = call.getBoolean("enabled", true);

        Handler mainHandler = new Handler(Looper.getMainLooper());
        mainHandler.post(() -> {
            WebView webView = (WebView) getBridge().getWebView();
            webView.getSettings().setJavaScriptEnabled(enabled);
            call.resolve();
        });
    }

    @PluginMethod
    public void setMediaPlaybackRequiresUserGesture(final PluginCall call) {
        boolean enabled = call.getBoolean("enabled", false);

        Handler mainHandler = new Handler(Looper.getMainLooper());
        mainHandler.post(() -> {
            WebView webView = (WebView) getBridge().getWebView();
            webView.getSettings().setMediaPlaybackRequiresUserGesture(enabled);
            call.resolve();
        });
    }
}