//
//  UpdatesDetailView.swift
//  Team15-App-V1
//
//  Created by Edward Chen on 11/8/22.
//

import SwiftUI

struct UpdatesDetailView: View {
  var transactions: updateData
    var body: some View {
      VStack{
        Text(transactions.symbol)
          .foregroundColor(Color(hue: 0.44, saturation: 0.706, brightness: 0.893))
          .fontWeight(.bold)
          .font(.title)
          .multilineTextAlignment(.leading)
          .padding()
//          .position(x: 60, y: 20)
        Text("$\(transactions.pricePerShare) per share")
          .foregroundColor(Color.black)
          .multilineTextAlignment(.leading)
          .padding()
        Text("\(transactions.shares) shares")
          .foregroundColor(Color.gray)
          .padding()
          
      }
      Spacer()
      Spacer()
    }
}

//struct UpdatesDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        UpdatesDetailView()
//    }
//}
