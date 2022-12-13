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
  @Published var curFollowing: [String]
  @Published var execFollowing: [String]
  @Published var isDefaultUser: Bool
  
  
  init (isLoggedin: Bool, needOnboarding: Bool, isNewUser: Bool) {
    self.isloggedin = isLoggedin
    self.needOnboarding = needOnboarding
    self.isNewUser = isNewUser
    self.curFollowing = []
    self.execFollowing = []
    self.isDefaultUser = false
//    let defaults = UserDefaults.standard
//    defaults.removeObject(forKey: "user")
//    if let savedUserData = defaults.object(forKey: "user") as? Data {
//        let decoder = JSONDecoder()
//        if let savedUser = try? decoder.decode(DefaultUser.self, from: savedUserData) {
//            print("Saved user: \(savedUser)")
//            print("here")
//          login(email: savedUser.email, password: savedUser.password)
//          self.isDefaultUser = true
//        }
//    }
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
            
            // storing user to user defaults
//            let defaults = UserDefaults.standard
//            let user = DefaultUser(email: email, password: password, rememberLogin: true, darkModeEnabled: false)
//            let encoder = JSONEncoder()
//            if let encodeUser = try? encoder.encode(user) {
//              defaults.set(encodeUser, forKey: "user")
//            }
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
        // get user following list
        let db = Firestore.firestore()
        guard let userID = Auth.auth().currentUser?.uid else { return }
        db.collection("users").whereField("uid", isEqualTo: userID)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                  if let temp = querySnapshot!.documents.first {
                    self.curFollowing = temp["following"] as? [String] ?? []
                    self.execFollowing = temp["execFollowing"] as? [String] ?? []
                  }
                }
        }
        // set log in status to true
        self.isloggedin = true
        
        // storing user to user defaults
//        let defaults = UserDefaults.standard
//        let user = DefaultUser(email: email, password: password, rememberLogin: true, darkModeEnabled: false)
//        let encoder = JSONEncoder()
//        if let encodeUser = try? encoder.encode(user) {
//          defaults.set(encodeUser, forKey: "user")
//        }
      }
    }
    self.isNewUser = false
  }
  
  func defaultLogin() {
    let defaults = UserDefaults.standard
    if let savedUserData = defaults.object(forKey: "user") as? Data {
        let decoder = JSONDecoder()
        if let savedUser = try? decoder.decode(DefaultUser.self, from: savedUserData) {
            print("Saved user: \(savedUser)")
          self.login(email: savedUser.email, password: savedUser.password)
        }
    }
  }
 
  func logout() {
    self.isloggedin = false
//    let defaults = UserDefaults.standard
//    defaults.removeObject(forKey: "user")
  }
  
  func completeOnboarding() {
    self.needOnboarding = false
  }
  
  
}

struct DefaultUser: Codable {
  let email: String
  let password: String
  let rememberLogin: Bool
  let darkModeEnabled: Bool
}
