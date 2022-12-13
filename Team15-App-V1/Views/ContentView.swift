//
//  ContentView.swift
//  Team15-App-V1
//
//  Created by Edward Chen on 11/5/22.
//

import SwiftUI

struct ContentView: View {
    // have a variable of whether user is logged in or not
  @StateObject var updates = Updates()
  @StateObject var news = News()
//  @StateObject var executives = Executives()
  @State private var loggedIn = false
  @ObservedObject var signUpController = SignUpController(isLoggedin: false, needOnboarding: true,
      isNewUser: true)
  
  init() {
      UITabBar.appearance().barTintColor = UIColor.systemBlue
      UITabBar.appearance().unselectedItemTintColor = UIColor.white
  }
  
    var body: some View {
      let userDefaults = UserDefaults.standard
//      if (userDefaults.bool(forKey: "user") == false) {
      if !signUpController.isDefaultUser {
        if signUpController.isloggedin{
          if (signUpController.needOnboarding && signUpController.isNewUser){
            Onboarding()
              .environmentObject(signUpController)
          } else {
            BottomBar().environmentObject(signUpController)
              .environmentObject(updates)
              .environmentObject(news)
          }
          
        } else {
          Landing().environmentObject(signUpController)
        }
      } else {
        BottomBar().environmentObject(signUpController)
          .environmentObject(updates)
          .environmentObject(news)
      }
        
//      }
//      else {
//        // load user from default
//
//        BottomBar()
//          .environmentObject(signUpController)
//          .environmentObject(updates)
//          .environmentObject(news)
//          .onAppear{
//            signUpController.defaultLogin()
//          }
//      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
