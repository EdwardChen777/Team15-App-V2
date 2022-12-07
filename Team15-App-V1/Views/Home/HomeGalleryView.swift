//
//  HomeGalleryView.swift
//  Team15-App-V1
//
//  Created by Philip Wellener on 11/7/22.
//

import SwiftUI

struct HomeGalleryView: View {
  @EnvironmentObject var updates: Updates
  @EnvironmentObject var news: News
  @Binding var feed: FeedData
  var body: some View {
    NavigationView {
      ScrollView {
        LazyVGrid(
          columns: Array(
            repeating: .init(.adaptive(minimum: 100), spacing: 10),
            count: 2
          ),
          spacing: 10
        ) {
          ForEach(feed.feed_items) { feed_item in

            NavigationLink(destination: displayCorrectFeedView(feed_item.type, id: feed_item.id, news: news, updates: updates)) {
              VStack {
                Text(feed_item.title)
                  .fontWeight(.bold)
                  .font(.title3)
                Text(feed_item.date)
                  .font(.body)
              }
            }.buttonStyle(PlainButtonStyle())
          }.padding(10).frame(maxWidth: .infinity, maxHeight: .infinity).overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 1))
        }
      }
    }
  }
}

//struct HomeGalleryView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeGalleryView()
//    }
//}
