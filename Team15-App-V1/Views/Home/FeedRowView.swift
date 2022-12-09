//
//  FeedRowView.swift
//  Team15-App-V1
//
//  Created by Philip Wellener on 12/6/22.
//

import SwiftUI

struct FeedRowView: View {
  var feed_item: Feed
  @EnvironmentObject var news: News
  @EnvironmentObject var updates: Updates
    var body: some View {
      NavigationLink(
        destination: displayCorrectFeedView(feed_item.type, id: feed_item.id, news: news, updates: updates),
        label: {
          HStack{
            VStack(alignment: .leading){
              Text(feed_item.title)
                .fontWeight(.bold)
                .font(.title3)
              Text(feed_item.date)
                .font(.body)
            }
          }
          
      })
    }
  
}

func displayCorrectFeedView(_ selectedOption: String, id: UUID, news: News, updates: Updates) -> some View {
    switch selectedOption {
    case "articleData":
      return AnyView(NewsDetailView(article: news.getArticle(id: id)))
    case "Transaction":
        return AnyView(UpdatesDetailView(transactions: updates.getTransaction(id: id)))
    default:
      return  AnyView(BottomBar())
    }
}
