//
//  WebVideoPlayer.swift
//  APOD
//
//  Created by Ульяна Гритчина on 07.07.2026.
//

import SwiftUI
import WebKit

public struct WebVideoPlayer: UIViewRepresentable {
    public let url: URL
    
    public init(url: URL) {
        self.url = url
    }
    
    public func makeUIView(context: Context) -> WKWebView {
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
    
    public func updateUIView(_ webView: WKWebView, context: Context) {}
}
