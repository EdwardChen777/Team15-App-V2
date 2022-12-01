//
//  WebView.swift
//  Team15-App-V1
//
//  Created by Philip Wellener on 11/30/22.
//

import WebKit
import Combine
import SwiftUI

struct WebView: UIViewRepresentable {
  func makeCoordinator() -> Coordinator {
    Coordinator(webView: self)
  }
  
  @ObservedObject var viewModel: WebViewModel
  func makeUIView(context: Context) -> WKWebView {
    let webView = WKWebView()
    webView.navigationDelegate = context.coordinator
    return webView
  }

  func updateUIView(_ webView: WKWebView, context: Context) {
    if let url = URL(string: "\(viewModel.urlString)") {
      webView.load(URLRequest(url: url))
    }
  }
  
  class Coordinator: NSObject, WKNavigationDelegate {
    var parent: WebView
    var webViewOptionsSubscriber: AnyCancellable?
    
    init (webView: WebView) {
      self.parent = webView
    }
    
    deinit {
      webViewOptionsSubscriber?.cancel()
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
      webViewOptionsSubscriber = parent.viewModel.webViewOptionsPublisher.sink(receiveValue: { webViewOption in
        // create a switch statement for each of the different options
        switch webViewOption {
        case .back:
          if webView.canGoBack {
            webView.goBack()
          }
        case .forward:
          if webView.canGoForward {
            webView.goForward()
          }
        case .share:
          self.parent.viewModel.shouldShowShareSheet = true
        case .refresh:
          webView.reload()
        case .stop:
          webView.stopLoading()
        }

      })
   }
    
  }
}
