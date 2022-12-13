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
//        destination: NewsDetailView(),
        label: {
          
          LazyVStack(alignment: .leading){
            AsyncImage(url: URL(string: article.imageUrl)) {
              phase in
              switch phase {
                case .empty:
                  Text("No image")
                case .success(let image):
                  image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 450, maxHeight: 200)
                case .failure:
                  EmptyView()
                default:
                  EmptyView()
              }
            
            }
            //                    .scaledToFit()
//                                .frame(height: 100)
            Text(article.title)
              .fontWeight(.bold)
              .font(.title3)
            Text("Source: " + article.source)
              .font(.body)
          }
          
          
//          HStack{
//            VStack(alignment: .leading){
//              VStack{
//                if (article.imageUrl != "none") {
//                  AsyncImage(url: URL(string: article.imageUrl))
//                    .scaledToFit()
//                    .frame(width: 100, height: 50)
////                      GeometryReader { geo in
////                        AsyncImage(url: URL(string: article.imageUrl))
////                          .aspectRatio(contentMode: .fit)
////                          .scaledToFit()
////                          .frame(width: geo.size.width, height: 300)
////                      }
//                }
//              }
//              Text(article.title)
//                .fontWeight(.bold)
//                .font(.title3)
//              Text("Source: " + article.source)
//                .font(.body)
////              Text(article.pubDate)
////                .font(.body)
//            }
//          }
          
      })
    }
}
