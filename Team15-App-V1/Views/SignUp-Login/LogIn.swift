//
//  LogIn.swift
//  Team15-App-V1
//
//  Created by Edward Chen on 11/5/22.
//

import SwiftUI

struct LogIn: View {
  @EnvironmentObject var signUpController: SignUpController
    @State private var email: String = ""
    @State private var password: String = ""
    var body: some View {
        VStack{
          TextField("Email",text: $email)
          TextField("Password",text: $password)
          Button(action: {signUpController.login(email: email, password: password)}) {
            Text("Log In")
              .padding(10.0)
              .overlay(RoundedRectangle(cornerRadius: 10.0)
              .stroke(lineWidth: 2.0))
          }
          .padding(.top,15)
          .disabled(email.isEmpty || password.isEmpty)
        }
    }
}

struct LogIn_Previews: PreviewProvider {
    static var previews: some View {
        LogIn()
    }
}
