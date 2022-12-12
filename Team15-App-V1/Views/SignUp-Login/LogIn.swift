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
        /*
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
         */
        ZStack {
            
            VStack {
                
                Spacer()
                Section{
                    Text("Log In")
                        .multilineTextAlignment(.leading)
                }
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    //.bold()
                //Spacer()
                Section {
                    
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
                    Button(action: {signUpController.login(email: email, password: password)}) {
                        HStack {
                                        Spacer()
                                        Text("Log In")
                                            .font(.headline)
                                            .foregroundColor(Color.white)
                                        Spacer()
                                    }
                                }
                                .padding(.vertical, 10.0)
                                .background(CustomColor.paleGreen)
                                .cornerRadius(10.0)
                                .padding(.horizontal, 50)
            
                }.disabled(password.isEmpty || email.isEmpty)
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

struct LogIn_Previews: PreviewProvider {
    static var previews: some View {
        LogIn()
    }
}
