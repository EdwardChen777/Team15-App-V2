//
//  ProfileView.swift
//  Team15-App-V1
//
//  Created by Edward Chen on 11/5/22.
//

import SwiftUI


struct ProfileView: View {
    var body: some View {
        VStack {
          Text("Preferences")
          NavigationView {
            ProfileSettings()
            AccountPreferences()
//            Spacer()
          }
        }
        .padding()
    }
}

struct ProfileSettings: View {
    var body: some View {
      Text("Profile Settings")
      NavigationLink(
        destination: AccountInformationView(),
        label: {
          Text("Account Information")
            .fontWeight(.bold)
            .font(.body)
        })
      NavigationLink(
        destination: PrivacyView(),
        label: {
          Text("Privacy Terms")
            .fontWeight(.bold)
            .font(.body)
        })
      NavigationLink(
        destination: NotificationsView(),
        label: {
          Text("Notifications")
            .fontWeight(.bold)
            .font(.body)
        })
//      NavigationLink(
//        destination: FollowingView(),
//        label: {
//          Text("Following")
//            .fontWeight(.bold)
//            .font(.body)
//        })
    }
}
struct AccountPreferences: View {
    var body: some View {
      Text("Account Preferences")
        NavigationLink(
          destination: InterestsView(),
          label: {
            Text("Interests & Preferences")
              .fontWeight(.bold)
              .font(.body)
          })
        NavigationLink(
          destination: FollowingView(),
          label: {
            Text("Following")
              .fontWeight(.bold)
              .font(.body)
          })
      }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
