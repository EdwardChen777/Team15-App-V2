//
//  UpdatesDetailView.swift
//  Team15-App-V1
//
//  Created by Edward Chen on 11/8/22.
//

import Charts
import SwiftUI

struct UpdatesDetailView: View {
  var transactions: Transaction
    var body: some View {
      VStack(alignment: .leading){
        Text(transactions.symbol)
          .foregroundColor(Color(hue: 0.44, saturation: 0.706, brightness: 0.893))
          .fontWeight(.bold)
          .font(.title)
          .multilineTextAlignment(.leading)
          .padding()
        Text(transactions.ownerName)
          .foregroundColor(Color(hue: 0.44, saturation: 0.706, brightness: 0.893))
        if let sth = transactions.nonDerivative.first {
          Text(sth.action)
            .foregroundColor(Color.black)
        }
        

//
//        Text("$\(transactions.pricePerShare) per share")
//          .foregroundColor(Color.black)
//          .multilineTextAlignment(.leading)
//          .padding()
//        Text("\(transactions.shares) shares")
//          .foregroundColor(Color.gray)
//          .padding()


      }
      Chart(transactions.nonDerivative) { element in
          BarMark (
            x: .value("Name",element.securityTitle),
            y: .value("Total Value",element.shares * element.pricePerShare)
          )
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
