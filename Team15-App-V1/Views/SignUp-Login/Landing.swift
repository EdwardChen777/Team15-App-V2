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
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.green, .white]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Welcome to Team 15 Project")
                Spacer()
                NavigationLink(destination: SignUp()) {
                    Text("Sign Up")
                        .foregroundColor(Color.white)
                        .padding(10.0)
                        .background(Color.green.cornerRadius(10.0))
                        //.scaleEffect(isPressed ? 0.95 : 1)
                }
                
                NavigationLink(destination: LogIn()) {
                    Text("Log In")
                        .foregroundColor(Color.white)
                        .padding(10.0)
                        .background(Color.green.cornerRadius(10.0))
                }
                .padding(.top,15)
                Spacer()
            }
            .padding()
            .offset(y: 300)
        }
    }
  }
}

struct Landing_Previews: PreviewProvider {
    static var previews: some View {
        Landing()
    }
}
