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
  var body: some View {
    VStack {
      Text(article.title).fontWeight(.bold)
        .font(.title3)
      Text(article.pubDate)
      Text("Source: " + article.source)
      Text(article.link)
      Spacer()
    }
  }
  
}
