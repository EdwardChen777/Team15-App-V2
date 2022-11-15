//
//  ContentView.swift
//  Team15-App-V1
//
//  Created by Edward Chen on 11/5/22.
//

import SwiftUI

struct ContentView: View {
    // have a variable of whether user is logged in or not
  @State private var loggedIn = false
  @ObservedObject var signUpController = SignUpController(isLoggedin: false, needOnboarding: true,
      isNewUser: true)
    var body: some View {
      if signUpController.isloggedin{
        if (signUpController.needOnboarding && signUpController.isNewUser){
          Onboarding()
            .environmentObject(signUpController)
        } else {
          BottomBar().environmentObject(signUpController)
        }
        
      } else {
        Landing().environmentObject(signUpController)
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
