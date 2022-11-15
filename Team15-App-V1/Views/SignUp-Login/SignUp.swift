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
            //Color.green
            
        
             
            
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
            ZStack {
                
                VStack {
                    Section{
                        Text("Sign Up")
                    }
                        .font(.largeTitle)
                        .padding()
                        
                    Section {
                        VStack(alignment: .leading) {
                                    Text("First Name")
                                        .font(.headline)
                                    TextField("Enter First Name", text: $firstname)
                                        .padding(.all)
                                        .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
                                        . cornerRadius(5.0)
                                        
                                }
                                .padding(.horizontal, 15)
                        VStack(alignment: .leading) {
                                    Text("Last Name")
                                        .font(.headline)
                                    TextField("Enter Last Name", text: $lastname)
                                        .padding(.all)
                                        .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
                                        . cornerRadius(5.0)
                                        
                                }
                                .padding(.horizontal, 15)
                        VStack(alignment: .leading) {
                                    Text("Email")
                                        .font(.headline)
                                    TextField("Enter Email", text: $email)
                                        .padding(.all)
                                        .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
                                        . cornerRadius(5.0)
                                        
                                }
                                .padding(.horizontal, 15)
                        VStack(alignment: .leading) {
                                    Text("Password")
                                        .font(.headline)
                                    TextField("Enter a Password", text: $password)
                                        .padding(.all)
                                        .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
                                        . cornerRadius(5.0)
                                        
                                }
                                .padding(.horizontal, 15)
                    }
                    
                    Section {
                        Button(action: {signUpController.signup(email: email, password: password, firstname: email,lastname: password)}) {
                            HStack {
                                            Spacer()
                                            Text("Create Account")
                                                .font(.headline)
                                                .foregroundColor(Color.white)
                                            Spacer()
                                        }
                                    }
                                    .padding(.vertical, 10.0)
                                    .background(Color.green)
                                    .cornerRadius(10.0)
                                    .padding(.horizontal, 50)
                
                    }.disabled(firstname.isEmpty || email.isEmpty)
                }
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(LinearGradient(gradient: Gradient(colors: [Color.green, Color.white]),
                                       startPoint: .topLeading,
                                       endPoint: .bottomTrailing)
                        //.edgesIgnoringSafeArea(.all)
                        .ignoresSafeArea()
                        //.overlay())
                        )
        
    }
  
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
