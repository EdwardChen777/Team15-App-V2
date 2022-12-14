//
//  UpdatesRowView.swift
//  Team15-App-V1
//
//  Created by Edward Chen on 11/8/22.
//

import SwiftUI

struct UpdatesRowView: View {
  var transactions: Transaction
  @EnvironmentObject var signUpController: SignUpController
    var body: some View {
      NavigationLink(
        destination: UpdatesDetailView(transactions: transactions).environmentObject(signUpController),
        label: {
          HStack{
            VStack(alignment: .leading){
              Text(transactions.issuer)
                .fontWeight(.bold)
                .font(.title3)
              Text("Transaction Made By: \(transactions.ownerName.capitalized)")
                .font(.body)
              Text("Date of Transaction: \(transactions.filedAt)")
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
