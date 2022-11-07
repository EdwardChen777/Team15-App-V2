//
//  NotificationsView.swift
//  Team15-App-V1
//
//  Created by Philip Wellener on 11/6/22.
//

import SwiftUI

struct NotificationsView: View {
    @State private var notificationsOn = true //doesnt do anything
  
    var body: some View {
      VStack {
        Toggle("Turn on Notifications", isOn: $notificationsOn)
      }
      .toggleStyle(.switch)
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
