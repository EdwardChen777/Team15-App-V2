//
//  SearchView.swift
//  Team15-App-V1
//
//  Created by Edward Chen on 11/5/22.
//

import SwiftUI

struct SearchView: View {
  @State var searchField: String = ""
  @State var displayedTransactions = [updateData]()
  @EnvironmentObject var updates: Updates
    var body: some View {
      let binding = Binding<String>(get: {
          self.searchField
        }, set: {
          self.searchField = $0
          self.updates.search(searchText: self.searchField)
          self.displayTransactions()
        })
      NavigationView {
        VStack {
          TextField("Search", text: binding)
          List{
            ForEach(displayedTransactions) {
              update in UpdatesRowView(transactions: update)
              
            }
          }.navigationBarTitle("Swift Repos")
        }
//        }.onAppear(perform: loadData)
        // replace the generic text above with a VStack as instructed
      }
    }
  
  func displayTransactions() {
//    if searchField == "" {
//      displayedTransactions = updates.transactions
//    } else {
//      displayedTransactions = updates.filteredTransactions
//    }
    if searchField != "" {
      displayedTransactions = updates.filteredTransactions
    }
  }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
