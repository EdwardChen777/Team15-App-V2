//
//  BottomBar.swift
//  Team15-App-V1
//
//  Created by Edward Chen on 11/5/22.
//

import SwiftUI

struct BottomBar: View {
  @EnvironmentObject var signUpController: SignUpController
  var body: some View {
      TabView {
        HomeView()
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
  }
}

struct BottomBar_Previews: PreviewProvider {
    static var previews: some View {
        BottomBar()
    }
}
