package com.neosyn.plugins.webviewconfigurator;

import android.os.Build;
import android.webkit.WebSettings;
import android.webkit.WebView;

public class WebViewConfigurator {
    private final WebView webView;

    public WebViewConfigurator(WebView webView) {
        this.webView = webView;
    }

    public void configureWebView() {
        webView.post(() -> {
            WebSettings settings = webView.getSettings();

            settings.setJavaScriptEnabled(true);
            settings.setDomStorageEnabled(true);
            settings.setMediaPlaybackRequiresUserGesture(false);
            settings.setAllowContentAccess(true);
            settings.setAllowFileAccess(true);

            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN) {
                settings.setAllowFileAccessFromFileURLs(true);
                settings.setAllowUniversalAccessFromFileURLs(true);
            }
        });
    }
}