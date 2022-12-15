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

//  @ObservedObject var updates: Updates
  var body: some View {
    ScrollView {
//        VStack{
//            Text("Search")
//                .foregroundColor(Color.white)
//                .font(.system(size: 40))
//                .bold()
//
//                .padding(.bottom)
//                .padding(.leading)
//
//        }
//        .frame(maxWidth: .infinity, maxHeight: 125, alignment: .bottomLeading)
//        .background(CustomColor.paleGreen)
//
//        .edgesIgnoringSafeArea(.top)
    VStack {
      VStack{
        Rectangle()
          .fill(CustomColor.paleGreen)
          .frame(height: 150)
          .overlay(Text("Welcome").font(.largeTitle)).foregroundColor(Color.white)
      }
      .background(Color.green)
      .clipShape(RoundedRectangle(cornerRadius: 20))
      .ignoresSafeArea()
        
      VStack{
        LabelledDivider(label: "Today's Transaction Stats").multilineTextAlignment(.center)
      }
        HStack{
            VStack{
                VStack {
                    //                  Spacer()
                    //                  Text("# of Transactions").font(.system(size: 12))
                    Spacer()
                    Image(systemName: "arrow.left.arrow.right").imageScale(.large)
                    Spacer()
                    Text(String(updates.getTodayTransactionCount())).font(.system(size: 12))
                    Spacer()
                }.frame(width: 110, height: 110)
                    .background(CustomColor.transGreen)
                    .cornerRadius(10)
                Text("# of Transactions").font(.system(size: 12))
            }
            Spacer()
            VStack{
                VStack {
                    
                    Spacer()
                    Image(systemName: "dollarsign.circle").imageScale(.large)
                    Spacer()
                    Text(String(updates.getTodayTradeVolume(transactions: updates.transactions))).font(.system(size: 12))
                    Spacer()
                }.frame(width: 110, height: 110)
                    .background(CustomColor.transGreen)
                    .cornerRadius(10)
                Text("Trade Volume").font(.system(size: 12))
            }
            Spacer()
            VStack{
                VStack {
                    
                    Spacer()
                    Image(systemName: "flame.fill").imageScale(.large)
                    Spacer()
                    Text(String(updates.getTodayHotStock())).font(.system(size: 12))
                    Spacer()
                }.frame(width: 110, height: 110)
                    .background(CustomColor.transGreen)
                    .cornerRadius(10)
                Text("Hottest Stock").font(.system(size: 12))
            }
        }
      VStack{
        LabelledDivider(label: "Your Feed")
      }
      
      
      Picker(selection: $selectedOption, label: Text("Select View")) {
        Text("List View").tag("List")
        Text("Gallery View").tag("Gallery")
      }.pickerStyle(.segmented)
            .foregroundColor(CustomColor.paleGreen)
      
      
      
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
