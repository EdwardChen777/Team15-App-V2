//
//  HomeGalleryView.swift
//  Team15-App-V1
//
//  Created by Philip Wellener on 11/7/22.
//

import SwiftUI

struct HomeGalleryView: View {
  @EnvironmentObject var updates: Updates
  var body: some View {
    ScrollView {
      LazyVGrid(
        columns: Array(
          repeating: .init(.adaptive(minimum: 100), spacing: 1),
          count: 2
        ),
        spacing: 1
      ) {
//        ForEach(Updates.results, id: \.self) { asset in
//
//          Button {
//            // TODO: Add tapping action here
//          } label: {
//            UpdatesDetailView(assetLocalId: asset.localIdentifier)
//          }
//        }
        ForEach(updates.transactions) { transaction in
          UpdatesRowView(transactions: transaction)
        }
      }
    }
  }
}

struct HomeGalleryView_Previews: PreviewProvider {
    static var previews: some View {
        HomeGalleryView()
    }
}
