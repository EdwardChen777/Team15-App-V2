//
//  NewsDetailView.swift
//  Team15-App-V1
//
//  Created by Philip Wellener on 11/30/22.
//

import Foundation

import SwiftUI

struct NewsDetailView: View {
  var article: articleData
  @ObservedObject var viewModel = WebViewModel()
  
  init(article: articleData) {
    self.article = article
    viewModel.urlString = article.link
  }

  var body: some View {
    VStack {
      WebView(viewModel: viewModel)
      Spacer()
      WebBottomBar(viewModel: viewModel)
    }
    .sheet(isPresented: $viewModel.shouldShowShareSheet) {
      if let url: URL = URL(string: "https://\(viewModel.urlString)") {
        ShareSheet(activityItems: [url])
      }
    }
  }
  
}
