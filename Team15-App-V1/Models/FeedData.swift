//
//  FeedData.swift
//  Team15-App-V1
//
//  Created by Philip Wellener on 12/5/22.
//

import Foundation

class FeedData: ObservableObject {
  @Published var feed_items: [Feed] = []
//  var feed_items: [Feed] = []
//  var news: [articleData]
//  var news: News
//  var articles: [articleData]
//  @EnvironmentObject var updates: Updates
//  var transactions: [Transaction]
  
  init(articles: [articleData], transactions: [Transaction]) {
//    var news: News
//    let news = News()
//    articles = []
//    let updates = Updates()
//    transactions = updates.transactions
//    Task {
//      news.fetchNews()
//      articles = news.articles
      
//      print("News Size: ")
//      print(articles.count)
    
//    news.fetchNews()
//    articles = news.articles
//    let updates = Updates()
//    transactions = updates.transactions
    
    print("News Size: ")
    print(articles.count)
    
    print("Transactions Size: ")
    print(transactions.count)
    
    for item in articles {
      feed_items.append(Feed(id: item.id, title: item.title, date: item.pubDate, type: "articleData"))
    }
    for item in transactions {
      feed_items.append(Feed(id: item.id, title: item.symbol, date: item.filedAt, type: "Transaction"))
    }
    print("Feed items Size: ")
    print(feed_items.count)
  }
  
  
}


struct Feed: Identifiable {
  var id: UUID
//  var old_id: String
  var title: String
  var date: String
  var type: String
  
  init(id: UUID, title: String, date: String, type: String) {
    self.id = id
    self.title = title
    self.date = date
    self.type = type
  }
}
