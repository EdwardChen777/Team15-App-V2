//
//  BottomBar.swift
//  Team15-App-V1
//
//  Created by Edward Chen on 11/5/22.
//

import SwiftUI

struct BottomBar: View {

//  var updates = Updates()
//  var news = News()

//  var updates = Updates()
//  var news = News()
  @EnvironmentObject var updates: Updates
  @EnvironmentObject var news: News
  @StateObject var profiles = UserRepository()
  var companies = Company()
  var executives = Executives()
  @State private var feed: FeedData = FeedData(articles: [], transactions: [])

//  var fetch = ApiFetch()
  @EnvironmentObject var signUpController: SignUpController
  
  
  var body: some View {
      TabView {
        HomeView(feed: $feed)
          .tabItem {
            Image(systemName: "house")
          }
          .toolbarBackground(.visible, for: .tabBar)
          .toolbarBackground(CustomColor.paleGreen, for: .tabBar)
        UpdatesView(current: updates.storyTransactions[0])
          .tabItem {
            Image(systemName: "line.diagonal.arrow")
          }
          .toolbarBackground(.visible, for: .tabBar)
          .toolbarBackground(CustomColor.paleGreen, for: .tabBar)
        SearchView()
          .tabItem {
              Image(systemName: "magnifyingglass")
          }
          .toolbarBackground(.visible, for: .tabBar)
          .toolbarBackground(CustomColor.paleGreen, for: .tabBar)
        NewsView()
          .tabItem {
            Image(systemName: "newspaper")
          }
          .toolbarBackground(.visible, for: .tabBar)
          .toolbarBackground(CustomColor.paleGreen, for: .tabBar)
        ProfileView()
          .tabItem {
            Image(systemName: "person")
          }
          .toolbarBackground(.visible, for: .tabBar)
          .toolbarBackground(CustomColor.paleGreen, for: .tabBar)
      }.accentColor(.white)
      .environmentObject(companies)
      .environmentObject(executives)
      .environmentObject(updates)
      .environmentObject(signUpController)
      .environmentObject(profiles)
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
