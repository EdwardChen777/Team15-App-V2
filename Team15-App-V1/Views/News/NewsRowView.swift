//
//  NewsRowView.swift
//  Team15-App-V1
//
//  Created by Philip Wellener on 11/30/22.
//

import SwiftUI

struct NewsRowView: View {
  var article: articleData
    var body: some View {
      NavigationLink(
        destination: NewsDetailView(article: article),
        label: {
          HStack{
            VStack(alignment: .leading){
              Text(article.title)
                .fontWeight(.bold)
                .font(.title3)
              Text("Source: " + article.source)
                .font(.body)
//              Text(article.pubDate)
//                .font(.body)
            }
          }
          
      })
    }
}
