//
//  BottomBar.swift
//  Team15-App-V1
//
//  Created by Edward Chen on 11/5/22.
//

import SwiftUI

struct BottomBar: View {
  var updates = Updates()
  var news = News()
  @State private var feed: FeedData = FeedData(articles: [], transactions: [])
//  var fetch = ApiFetch()
  @EnvironmentObject var signUpController: SignUpController
  var body: some View {
      TabView {
        HomeView(feed: $feed)
          .tabItem {
            Image(systemName: "house")
          }
        UpdatesView()
          .tabItem {
            Image(systemName: "line.diagonal.arrow")
          }
        SearchView()
          .tabItem {
            Image(systemName: "magnifyingglass")
          }
        NewsView()
          .tabItem {
            Image(systemName: "newspaper")
          }
        ProfileView()
          .tabItem {
            Image(systemName: "person")
          }
      }.accentColor(.black)
      .environmentObject(updates)
      .environmentObject(news)
      .onAppear {
                feed = FeedData(articles: news.articles, transactions: updates.transactions)
              }
      .toolbarBackground(CustomColor.paleGreen)

//      .environmentObject(fetch)
  }
}

struct BottomBar_Previews: PreviewProvider {
    static var previews: some View {
        BottomBar()
    }
}
