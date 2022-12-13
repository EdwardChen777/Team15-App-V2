//
//  Executives.swift
//  Team15-App-V1
//
//  Created by Edward Chen on 12/13/22.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestoreSwift

class Executives: ObservableObject {
  @Published var executives: [executiveData] = []
  @Published var searchText : String = ""
  @Published var filteredExecutives: [executiveData] = []
  
  init() {
    let db = Firestore.firestore()
    
    // add a field in python so that every document has a field of same value
    db.collection("executives").getDocuments {snapshot, err in
      if err == nil {
        if let snapshot = snapshot {
          self.executives = snapshot.documents.map { d in
            let name = d["name"] as? String ?? "none"
            print(name)
            return executiveData(execId: d["id"] as? String ?? "none",
                                 cik: d["cik"] as? String ?? "none",
                                 ticker: d["ticker"] as? String ?? "none",
                                 name: d["name"] as? String ?? "none",
                                 position: d["position"] as? String ?? "none",
                                 year: d["year"] as? Int ?? 0,
                                 salary: d["salary"] as? Int ?? 0,
                                 bonus: d["bonus"] as? Int ?? 0,
                                 stockAwards: d["stockAwards"] as? Int ?? 0,
                                 optionAwards: d["optionAwards"] as? Int ?? 0,
                                 nonEquityCompensation: d["nonEquityCompensation"] as? Int ?? 0,
                                 otherCompensation: d["otherCompensation"] as? Int ?? 0,
                                 total: d["total"] as? Int ?? 0)
          }
        }
      }
    }
  }
  
  func search(searchText: String) {
      self.filteredExecutives = self.executives.filter { executive in
        return executive.ticker.lowercased().contains(searchText.lowercased()) ||
          executive.name.lowercased().contains(searchText.lowercased())
      }
  }
  
  func follow(name: String, controller: SignUpController) {
    guard let userID = Auth.auth().currentUser?.uid else { return }
    let db = Firestore.firestore()
    
    db.collection("users").whereField("uid", isEqualTo: userID)
        .getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
              if let temp = querySnapshot!.documents.first {
                var list = temp["execFollowing"] as? [String] ?? []
                if !list.contains(name) {
                  list.append(name)
                }
                temp.reference.updateData(["execFollowing": list])
              }
            }
    }
    if !controller.execFollowing.contains(name) {
      controller.execFollowing.append(name)
    }
    
  }
  func unfollow(name: String, controller: SignUpController) {
    guard let userID = Auth.auth().currentUser?.uid else { return }
    let db = Firestore.firestore()
    
    db.collection("users").whereField("uid", isEqualTo: userID)
        .getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
              if let temp = querySnapshot!.documents.first {
                var list = temp["execFollowing"] as? [String] ?? []
                if list.contains(name) {
                  list = list.filter {$0 != name}
                }
                temp.reference.updateData(["execFollowing": list])
              }
            }
    }
    
    // update the curr follow list
    if controller.execFollowing.contains(name) {
      controller.execFollowing = controller.execFollowing.filter {$0 != name}
    }
    
  }

}

struct executiveData: Identifiable {
  let execId: String
  let cik: String
  let ticker: String
  let name: String
  let position: String
  let year: Int
  let salary: Int
  let bonus: Int
  let stockAwards: Int
  let optionAwards: Int
  let nonEquityCompensation: Int
  let otherCompensation: Int
  let total: Int
  
  var id = UUID()
}
