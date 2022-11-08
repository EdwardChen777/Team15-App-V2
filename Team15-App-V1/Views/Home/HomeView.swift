//
//  HomeView.swift
//  Team15-App-V1
//
//  Created by Edward Chen on 11/5/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
          Text("Welcome").font(.largeTitle)
          
          Spacer()
        }
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
