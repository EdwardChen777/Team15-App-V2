//
//  HomeView.swift
//  Team15-App-V1
//
//  Created by Edward Chen on 11/5/22.
//

import SwiftUI

struct HomeView: View {
  @State var selectedOption = "List"
    var body: some View {
        VStack {
          Text("Welcome").font(.largeTitle)
          Text("Today's Politicions Movement").font(.title)
          HStack {
            Text("# of Transactions").font(.caption)
            Text("Trade Volume").font(.caption)
            Text("Hotteset Stock").font(.caption)
          }
          Picker(selection: $selectedOption, label: Text("Select View")) {
              Text("List View").tag("List")
              Text("Gallery View").tag("Gallery")
          }.pickerStyle(.segmented)

          displayCorrectView(selectedOption)
          Spacer()
        }
        .padding()
    }
}


// Adapted off of https://developer.apple.com/forums/thread/652955
func displayCorrectView(_ selectedOption: String) -> some View {
    switch selectedOption {
    case "List":
        return AnyView(HomeGalleryView())
    case "Gallery":
        return AnyView(HomeListView())
    default:
      return AnyView(HomeListView())
    }
  
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
