//
//  NewsView.swift
//  Team15-App-V1
//
//  Created by Edward Chen on 11/5/22.
//

import SwiftUI

struct NewsView: View {
  @EnvironmentObject var news: News
    var body: some View {
      NavigationView {
        List{
          ForEach(news.articles) { article in
            NewsRowView(article: article)
          }
//          .onDelete(perform: removeRows)
        }.navigationBarTitle("News")
      }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}

