//
//  WebViewModel.swift
//  Team15-App-V1
//
//  Created by Philip Wellener on 12/1/22.
//


import Foundation
import Combine

enum WebViewOptions {
  case back
  case forward
  case share
  case refresh
  case stop
}

class WebViewModel: ObservableObject {
//  @Published var urlString: String = ""
  @Published var urlString: String = ""
  @Published var webViewOptionsPublisher = PassthroughSubject<WebViewOptions, Never>()
  @Published var shouldShowShareSheet: Bool = false
  
//  init(url: String) {
//    self.urlString = url
//  }
  
  func goBack() {
    webViewOptionsPublisher.send(.back)
  }
  func goForward() {
    webViewOptionsPublisher.send(.forward)
  }
  func share() {
    webViewOptionsPublisher.send(.share)
  }
  func refresh() {
    webViewOptionsPublisher.send(.refresh)
  }
  func stop() {
    webViewOptionsPublisher.send(.stop)
  }
}

