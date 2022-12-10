//
//  UpdatesView.swift
//  Team15-App-V1
//
//  Created by Edward Chen on 11/5/22.
//
import Swift
import SwiftUI
import Charts

struct UpdatesView: View {
  @EnvironmentObject var updates: Updates

  
  @State var show = false
  @State var current: StoryUpdates
//  @State var current : Post!
  @State var data = [
    Post(id: 0, name: "Apple", url: "p1", seen: false, proPic: "img1", loading: false),
    Post(id: 1, name: "Tesla", url: "p2", seen: false, proPic: "img2", loading: false),
    Post(id: 0, name: "Google", url: "p3", seen: false, proPic: "img3", loading: false),
    Post(id: 0, name: "Nike", url: "p4", seen: false, proPic: "img4", loading: false)
  ]
  
    var body: some View {
      NavigationView {
//        VStack{
          
          ZStack{
            Color.black.opacity(0.05).edgesIgnoringSafeArea(.all)
//              CustomColor.paleGreen.edgesIgnoringSafeArea(.all)
            ZStack{
              VStack{
                ScrollView(.horizontal, showsIndicators: false) {
                  HStack(spacing: 22){
                    // this button is kind of useless
                    Button(action: {}) {
                      VStack(spacing: 8) {
                        ZStack(alignment: .bottomTrailing) {
                          Image(systemName: "plus")
                            .resizable()
                            .frame(width: 12, height: 12)
                            .padding(8)
                            .background(Color.white)
                            .clipShape(Circle())
                            .offset(x: 6)
                        }
                        Text("You")
                          .foregroundColor(.black)
                      }
                    }
                    ForEach(0..<updates.filteredStoryTransactions.count) { i in
                      VStack(spacing: 8) {
                        ZStack {
//                          Image(updates.storyTransactions[i].proPic)
//                            .resizable()
//                            .frame(width: 65, height: 65)
//                            .clipShape(Circle())
                          AsyncImage(url: URL(string: updates.filteredStoryTransactions[i].proPic))
                            .frame(width: 65, height: 65)
                            .clipShape(Circle())
                          
                          if !updates.filteredStoryTransactions[i].seen {
                            Circle()
                              .trim(from: 0, to: 1)
                              .stroke(AngularGradient(gradient: .init(colors: [.red,.orange,.red]), center: .center), style: StrokeStyle(lineWidth: 4, dash: [updates.filteredStoryTransactions[i].loading ? 7 : 0]))
                              .frame(width: 74, height: 74)
                              .rotationEffect(.init(degrees: updates.filteredStoryTransactions[i].loading ? 360 : 0))
                          }
                          
                        }
                        Text(updates.filteredStoryTransactions[i].name)
                          .foregroundColor(.black)
                          .lineLimit(1)
                        
                      }
                      .frame(width: 75)
                      .onTapGesture {
                        withAnimation(Animation.default.speed(0.35).repeatForever(autoreverses: false)) {
                          updates.filteredStoryTransactions[i].loading.toggle()
                          DispatchQueue.main.asyncAfter(deadline: .now() + (updates.filteredStoryTransactions[i].seen ? 0 : 1.2)) {
                            self.current = updates.filteredStoryTransactions[i]
                            withAnimation(.default) {
                              self.show.toggle()
                            }
                            
                            updates.filteredStoryTransactions[i].loading = false
                            updates.filteredStoryTransactions[i].seen = true
                            updates.filteredStoryTransactions = updates.filteredStoryTransactions.sorted{!$0.seen && $1.seen}
                          }
                        }
                      }
                    }
                    
                  }
                  .padding(.horizontal)
                  .padding(.top)
                }
                
                List{
                  ForEach(updates.transactions) { transaction in
                    UpdatesRowView(transactions: transaction)
                  }
                }
                
              }.navigationBarTitle(self.show ? "" : "Updates")
                .navigationBarHidden(self.show ? true : false)
              
              if self.show{
                ZStack {
                  Color.gray.edgesIgnoringSafeArea(.all)
//                  CustomColor.paleGreen.edgesIgnoringSafeArea(.all)
                  
                  ZStack(alignment: .topLeading) {
                    GeometryReader{ _ in
                      VStack{
                        // charts here or something
                        Text("hi")
//                        Image(self.current.url)
//                          .resizable()
//                          .aspectRatio(contentMode: .fit)
                      }
                    }
                    VStack(spacing: 12){
                      
                      Loader(show: self.$show)
                      
                      HStack(spacing: 15){
                        AsyncImage(url: URL(string: self.current.proPic))
//                          .resizable()
                          .frame(width: 55, height: 55)
                          .clipShape(Circle())
//                        Image(self.current.proPic)
//                          .resizable()
//                          .frame(width: 55, height: 55)
//                          .clipShape(Circle())
                        
                        Text(self.current.name)
                          .foregroundColor(.white)
                        
                        Spacer()
                      }
                      .padding(.leading)
                      
                      // graph
                      
                      GroupBox ("Non Derivative Transactions") {
                        Chart(self.current.transactions) { element in
//                          if element.transactionPrice > 0 {
                            BarMark (
                              x: .value("Name",element.transactionPrice),
                              y: .value("Total Value",element.share)
                            )
                            .foregroundStyle(by: .value("Action",element.transactionCode))
                            .position(by: .value("Action",element.transactionCode))
//                          }

                        }
                        .chartYAxis {
                          AxisMarks(position: .leading)
                        }
                        .chartXAxisLabel("Price Per Share")
                        .chartYAxisLabel("Shares Involved")
//                        .chartForegroundStyleScale([
//                          "P": Color.green,
//                          "S": Color.red
//                        ])
                        .frame(height: 250)
                      }
                    }
                    .padding(.top)
                  
                  }
                }
                .toolbar(.hidden, for: .tabBar)
                .transition(.move(edge: .trailing))
                .onTapGesture {
//                  withAnimation(.default) {
//                    self.show = false
//                  }
                  self.show.toggle()
                }
              }
            }
            
          }
          
        
      }
    }
}

struct Loader : View {
  
  @State var width : CGFloat = 100
  @Binding var show : Bool
  var time = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
  @State var secs : CGFloat = 0
  
  var body : some View {
    ZStack(alignment: .leading){
      Rectangle()
        .fill(Color.white.opacity(0.6))
        .frame(height: 3)
      Rectangle()
        .fill(Color.white)
        .frame(width: self.width, height: 3)
    }
    .onReceive(self.time) { (_) in
      
      self.secs += 0.1
      
      if secs <= 6 {
        let screenWidth = UIScreen.main.bounds.width
        
        self.width = screenWidth * (self.secs / 6)
      } else {
        self.show = false
      }
      
    }
  }
}

//struct UpdatesView_Previews: PreviewProvider {
//    static var previews: some View {
//        UpdatesView()
//    }
//}

struct Post : Identifiable{
  var id : Int
  var name : String
  var url : String
  var seen : Bool
  var proPic : String
  var loading : Bool
}
