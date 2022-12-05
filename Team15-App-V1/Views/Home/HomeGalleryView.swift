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
    NavigationView {
      ScrollView {
        LazyVGrid(
          columns: Array(
            repeating: .init(.adaptive(minimum: 100), spacing: 10),
            count: 2
          ),
          spacing: 10
        ) {
          ForEach(updates.transactions) { transaction in

            NavigationLink(destination: UpdatesDetailView(transactions: transaction)) {
              VStack {
                Text(transaction.issuer)
                  .fontWeight(.bold)
                  .font(.title3)
                Text(transaction.symbol)
                  .font(.body)
              }
            }.buttonStyle(PlainButtonStyle())
          }.padding(10).frame(maxWidth: .infinity, maxHeight: .infinity).overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 1))
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
