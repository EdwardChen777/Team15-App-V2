//
//  SignUp.swift
//  Team15-App-V1
//  M2
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
                    
                    Spacer()
                    Section{
                        Text("Sign Up")
                            .multilineTextAlignment(.leading)
                    }
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        //.bold()
                    Section {
                        VStack(alignment: .leading) {
                                    Text("First Name")
                                        .font(.headline)
                                    TextField("Enter First Name", text: $firstname)
                                        .disableAutocorrection(true)
                                        .autocapitalization(.none)
                                        .padding(.all)
                                        .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
                                        . cornerRadius(5.0)
                                        
                                }
                                .padding(.horizontal, 15)
                        VStack(alignment: .leading) {
                                    Text("Last Name")
                                        .font(.headline)
                                    TextField("Enter Last Name", text: $lastname)
                                        .autocapitalization(.none)
                                        .disableAutocorrection(true)
                                        .padding(.all)
                                        .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
                                        . cornerRadius(5.0)
                                        
                                }
                                .padding(.horizontal, 15)
                        VStack(alignment: .leading) {
                                    Text("Email")
                                        .font(.headline)
                                    TextField("Enter Email", text: $email)
                                        .disableAutocorrection(true)
                                        .autocapitalization(.none)
                                        .padding(.all)
                                        .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
                                        . cornerRadius(5.0)
                                        
                                }
                                .padding(.horizontal, 15)
                        VStack(alignment: .leading) {
                                    Text("Password")
                                        .font(.headline)
                                    TextField("Enter a Password", text: $password)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                                        .padding(.all)
                                        .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
                                        . cornerRadius(5.0)
                                        
                                }
                                .padding(.horizontal, 15)
                    }
                    Spacer()
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
                                    .background(CustomColor.paleGreen)
                                    .cornerRadius(10.0)
                                    .padding(.horizontal, 50)
                
                    }.disabled(firstname.isEmpty || email.isEmpty)
                    Spacer()
                }
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(LinearGradient(gradient: Gradient(colors: [CustomColor.paleGreen, Color.white]),
                                       startPoint: .topLeading,
                                       endPoint: .bottomTrailing)
                        //.edgesIgnoringSafeArea(.all)
                        .ignoresSafeArea()
                        //.overlay())
                        )
        
    }
  
}

struct CustomColor {
    static let paleGreen = Color("paleGreen")
    static let transGreen = Color("transGreen")
}



struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}

