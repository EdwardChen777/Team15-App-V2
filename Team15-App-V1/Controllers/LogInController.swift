//
//  LogInController.swift
//  Team15-App-V1
//
//  Created by Edward Chen on 11/5/22.
//

import Foundation
import FirebaseAuth
import Firebase

class LogInController: ObservableObject{
  @Published var isloggedin: Bool
  
  init (isLoggedin: Bool) {
    self.isloggedin = isLoggedin
  }
  
  func login(email: String, password: String, firstname: String, lastname: String) {
    
    Auth.auth().createUser(withEmail: email, password: password) {
      (result, error) in
      if let err = error{
        print("Error creating user")
      } else {
        let db = Firestore.firestore()
        db.collection("users").addDocument(data: ["firstname": firstname, "lastname": lastname, "uid": result!.user.uid]) { (error) in
          if error != nil {
            print("Error saving user data")
          }
        }
        self.isloggedin = true
//        transitionToHome()
      }
    }
  }
  
  func checkLogin() -> Bool {
    if self.isloggedin {
      return true
    } else {
      return false
    }
  }
  
}
