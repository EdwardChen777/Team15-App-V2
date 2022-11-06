//
//  User.swift
//  Team15-App-V1
//
//  Created by Edward Chen on 11/5/22.
//

import Foundation

struct User: Identifiable {
  var name: String
  var logged_in: Bool
  var id = UUID()    // To conform to Identifialbe protocol

  init(name: String, logged_in: Bool) {
      self.name = name
      self.logged_in = logged_in
  }
  
  
  
}
