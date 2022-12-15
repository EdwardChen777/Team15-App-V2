//
//  NotificationsView.swift
//  Team15-App-V1
//
//  Created by Philip Wellener on 11/6/22.
//

import SwiftUI

struct NotificationsView: View {
    @State private var notificationsOn = true //doesnt do anything
//    @State private var accessibleColors = false
  
  @EnvironmentObject var signUpController: SignUpController
    var body: some View {
      //Text("Notifications").font(.title)
      VStack {
        Toggle("Turn on Notifications", isOn: $notificationsOn)
        Toggle("Accessible Colors", isOn: $signUpController.isAccessible)
      }
      .navigationBarTitle("Notifications")
      .toggleStyle(.switch)
      .padding(.leading, 10)
      .padding(.trailing, 20)
        Spacer()
    }
    
}

//struct NotificationsView_Previews: PreviewProvider {
//    static var previews: some View {
//        NotificationsView()
//    }
//}
