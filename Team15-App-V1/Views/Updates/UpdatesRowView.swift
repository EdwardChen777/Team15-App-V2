//
//  UpdatesRowView.swift
//  Team15-App-V1
//
//  Created by Edward Chen on 11/8/22.
//

import SwiftUI

struct UpdatesRowView: View {
  var transactions: updateData
    var body: some View {
      NavigationLink(
        destination: UpdatesDetailView(transactions: transactions),
        label: {
          Text(transactions.filedAt)
            .fontWeight(.bold)
            .font(.body)
      })
    }
}

//struct UpdatesRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        UpdatesRowView()
//    }
//}
