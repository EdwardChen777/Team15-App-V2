//
//  Landing.swift
//  Team15-App-V1
//
//  Created by Edward Chen on 11/5/22.
//

import SwiftUI

struct Landing: View {
  var body: some View {
    NavigationView {
      VStack { 
        Text("Welcome to Team 15 Project")
        Spacer()
        NavigationLink(destination: SignUp()) {
          Text("Sign Up")
            .padding(10.0)
            .overlay(RoundedRectangle(cornerRadius: 10.0)
              .stroke(lineWidth: 2.0))
          
        }
        
        NavigationLink(destination: LogIn()) {
          Text("Log In")
            .padding(10.0)
            .overlay(RoundedRectangle(cornerRadius: 10.0)
              .stroke(lineWidth: 2.0))
        }
        .padding(.top,15)
        Spacer()
      }
      .padding()
      .offset(y: 300)
    }
  }
}

struct Landing_Previews: PreviewProvider {
    static var previews: some View {
        Landing()
    }
}
