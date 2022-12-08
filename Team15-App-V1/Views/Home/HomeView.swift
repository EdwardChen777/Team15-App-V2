//
//  HomeView.swift
//  Team15-App-V1
//
//  Created by Edward Chen on 11/5/22.
//

import SwiftUI

struct HomeView: View {
  @State var selectedOption = "List"
  @EnvironmentObject var updates: Updates
  @EnvironmentObject var news: News
  @Binding var feed: FeedData
  var body: some View {
    ScrollView {
      VStack {
        VStack{
          Rectangle()
            .fill(CustomColor.paleGreen)
            .frame(height: 200)
            .overlay(Text("Welcome").font(.largeTitle)).foregroundColor(Color.white)
        }
        .background(Color.green)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .ignoresSafeArea()
        VStack{
          LabelledDivider(label: "Today's Trends")
        }
        HStack{
          RoundedRectangle(cornerRadius: 10)
            .fill(CustomColor.transGreen)
            .frame(width: 110, height: 110)
            .overlay(Text("Transactions")).font(.system(size: 12))
          Spacer()
          RoundedRectangle(cornerRadius: 10)
            .fill(CustomColor.transGreen)
            .frame(width: 110, height: 110)
            .overlay(Text("Trade Volume")).font(.system(size: 12))
          Spacer()
          RoundedRectangle(cornerRadius: 10)
            .fill(CustomColor.transGreen)
            .frame(width: 110, height: 110)
            .overlay(Text("Hottest Stock")).font(.system(size: 12))
          
        }
        VStack{
          LabelledDivider(label: "Your Feed")
        }
        
        
        Picker(selection: $selectedOption, label: Text("Select View")) {
          Text("List View").tag("List")
          Text("Gallery View").tag("Gallery")
        }.pickerStyle(.segmented)

        displayCorrectView(selectedOption)
        Spacer()
      }
      .padding()
    }
  }
  
  // Adapted off of https://developer.apple.com/forums/thread/652955
  func displayCorrectView(_ selectedOption: String) -> some View {
      switch selectedOption {
      case "Gallery":
        return AnyView(HomeGalleryView(feed: $feed))
      case "List":
        return AnyView(HomeListView(feed: $feed))
      default:
        return AnyView(HomeListView(feed: $feed))
      }
    
  }
}
