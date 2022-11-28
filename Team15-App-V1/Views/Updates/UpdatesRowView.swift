//
//  UpdatesRowView.swift
//  Team15-App-V1
//
//  Created by Edward Chen on 11/8/22.
//

import SwiftUI

struct UpdatesRowView: View {
  var transactions: Transaction
    var body: some View {
      NavigationLink(
        destination: UpdatesDetailView(transactions: transactions),
        label: {
          HStack{
            VStack(alignment: .leading){
              Text(transactions.issuer)
                .fontWeight(.bold)
                .font(.title3)
              Text(transactions.symbol)
                .font(.body)
            }
          }
          
      })
    }
}

//struct UpdatesRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        UpdatesRowView()
//    }
//}
