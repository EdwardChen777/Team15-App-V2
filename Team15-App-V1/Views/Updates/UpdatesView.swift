//
//  UpdatesView.swift
//  Team15-App-V1
//
//  Created by Edward Chen on 11/5/22.
//

import SwiftUI

struct UpdatesView: View {
  @EnvironmentObject var updates: Updates
    var body: some View {
      NavigationView {
        List{
          ForEach(updates.transactions) { transaction in
            UpdatesRowView(transactions: transaction)
          }
//          .onDelete(perform: removeRows)
        }.navigationBarTitle("Library")
      }
    }
}

struct UpdatesView_Previews: PreviewProvider {
    static var previews: some View {
        UpdatesView()
    }
}
