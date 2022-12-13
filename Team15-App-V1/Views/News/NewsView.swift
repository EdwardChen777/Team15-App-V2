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
        VStack{
            VStack{
                Text("News")
                    .foregroundColor(Color.white)
                    .font(.system(size: 40))
                    .bold()
                    .padding(.bottom)
                    .padding(.leading)
                
            }
            .frame(maxWidth: .infinity, maxHeight: 125, alignment: .bottomLeading)
            .background(CustomColor.paleGreen)
        
            .edgesIgnoringSafeArea(.top)
//            Text("")
//                .foregroundColor(Color.white)
//                .font(.system(size: 40))
//            // .bold()
//                .frame(maxWidth: .infinity, maxHeight: 125)
//                .background(CustomColor.paleGreen)
//
//                .edgesIgnoringSafeArea(.top)
//            //                    .padding([.bottom], -100)
            NavigationView {
                List{
                    ForEach(news.articles) { article in
                        NewsRowView(article: article)
                    }
                    //          .onDelete(perform: removeRows)
                }
                //.navigationBarTitle("News")
            }
            .padding([.top], -50)
        }
    }
}
//
//struct NewsView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsView()
//    }
//}

