//
//  HomeListView.swift
//  Team15-App-V1
//
//  Created by Philip Wellener on 11/7/22.
//

import SwiftUI

struct HomeListView: View {
  @EnvironmentObject var updates: Updates
  @EnvironmentObject var news: News
  @Binding var feed: FeedData
    var body: some View {
      NavigationView {
        List{
          ForEach(feed.feed_items) { feed_item in
            FeedRowView(feed_item: feed_item)
          }
        }
      }.onAppear {
        feed = FeedData(articles: news.articles, transactions: updates.transactions)
      }
      
    }
}

//struct HomeListView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeListView()
//    }
//}
