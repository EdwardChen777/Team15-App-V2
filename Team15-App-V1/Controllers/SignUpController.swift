//
//  SignUpController.swift
//  Team15-App-V1
//
//  Created by Edward Chen on 11/5/22.
//

import Foundation
import FirebaseAuth
import Firebase

class SignUpController: ObservableObject{
  @Published var isloggedin: Bool
  @Published var needOnboarding: Bool
  @Published var isNewUser: Bool
  
  init (isLoggedin: Bool, needOnboarding: Bool, isNewUser: Bool) {
    self.isloggedin = isLoggedin
    self.needOnboarding = needOnboarding
    self.isNewUser = isNewUser
  }
  
  func signup(email: String, password: String, firstname: String, lastname: String) {
    
    Auth.auth().createUser(withEmail: email, password: password) {
      (result, error) in
      if let err = error{
        print("Error creating user")
      } else {
        let db = Firestore.firestore()
        db.collection("users").addDocument(data: ["firstname": firstname, "lastname": lastname, "uid": result!.user.uid]) { (error) in
          if error != nil {
            print("Error saving user data")
          } else {
            self.isloggedin = true
          }
        }
      }
    }
    
  }
  
  func login(email: String, password: String) {
    
    Auth.auth().signIn(withEmail: email, password: password) {
      (result,error) in
      
      if error != nil {
        print("Error logging in")
      } else {
        self.isloggedin = true
      }
    }
    self.isNewUser = false
  }
  
  func completeOnboarding() {
    self.needOnboarding = false
  }
  
  
}
