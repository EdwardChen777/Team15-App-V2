//
//  HomeListView.swift
//  Team15-App-V1
//
//  Created by Philip Wellener on 11/7/22.
//

import SwiftUI

struct HomeListView: View {
  @EnvironmentObject var updates: Updates
    var body: some View {
      NavigationView {
        List{
          ForEach(updates.transactions) { transaction in
            UpdatesRowView(transactions: transaction)
          }
//          .onDelete(perform: removeRows)
        }
      }
      
    }
}

struct HomeListView_Previews: PreviewProvider {
    static var previews: some View {
        HomeListView()
    }
}
