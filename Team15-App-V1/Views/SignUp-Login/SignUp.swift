//
//  SignUp.swift
//  Team15-App-V1
//
//  Created by Edward Chen on 11/5/22.
//

import SwiftUI

struct SignUp: View {
  @EnvironmentObject var signUpController: SignUpController
    @State private var firstname: String = ""
    @State private var lastname: String = ""
    @State private var email: String = ""
//    @State private var phone: String = ""
    @State private var password: String = ""
  var body: some View {
    
    //      VStack{
    //        TextField("Username",text: $firstname)
    //        TextField("Username",text: $lastname)
    //        TextField("Email",text: $email)
    //        TextField("Password",text: $password)
    //        Text("Hello, \(firstname)!")
    //        if ValidateController.validSignUp(email, password) {
    //
    //        }
    //        Button(action: {}) {
    //          Text("Log In")
    //            .padding(10.0)
    //            .overlay(RoundedRectangle(cornerRadius: 10.0)
    //            .stroke(lineWidth: 2.0))
    //        }
    //        .padding(.top,15)
    //      }
      Form {
        Section {
          TextField("First Name", text: $firstname)
          TextField("Email", text: $email)
          TextField("Password", text: $password)
        }
        
        Section {
          Button(action: {signUpController.signup(email: email, password: password, firstname: email,lastname: password)}) {
              Text("Create Account")
            }
        }.disabled(firstname.isEmpty || email.isEmpty)
      }
      
      
    }
  
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
