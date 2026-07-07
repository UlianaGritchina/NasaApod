//
//  WebVideoPlayer.swift
//  APOD
//
//  Created by Ульяна Гритчина on 07.07.2026.
//

import SwiftUI
import WebKit

struct WebVideoPlayer: UIViewRepresentable {

    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let configuration = WKWebViewConfiguration()
        configuration.allowsInlineMediaPlayback = true
        let webView = WKWebView(
            frame: .zero,
            configuration: configuration
        )
        webView.scrollView.isScrollEnabled = false
        webView.load(URLRequest(url: url))
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {}
}
