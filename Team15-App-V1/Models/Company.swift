//
//  Company.swift
//  Team15-App-V1
//
//  Created by Edward Chen on 12/5/22.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

// i either nest the api calls or i get the value from first call the sequentially call (both not working)

class Company: ObservableObject {
  @Published var companies: [companyData] = []
  @Published var searchText : String = ""
  @Published var filteredCompanies: [companyData] = []
  
  init() {
    let db = Firestore.firestore()
    
    // add a field in python so that every document has a field of same value
    db.collection("companies").whereField("identifiable", isEqualTo: "Team15")
        .getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
              self.companies = querySnapshot!.documents.map { d in
                return companyData(exchange: d["exchange"] as? String ?? "none",
                                   marketCap: d["marketCap"] as? Float ?? 0.0,
                                   name: d["name"] as? String ?? "none",
                                   sharesOutstanding: d["sharesOutstanding"] as? Float ?? 0.0,
                                   ticker: d["ticker"] as? String ?? "none",
                                   logo: d["logo"] as? String ?? "none",
                                   industry: d["industry"] as? String ?? "none",
                                   hasRecommendation: d["hasRecommendation"] as? Bool ?? false,
                                   buy: d["buy"] as? Int ?? -1,
                                   sell: d["sell"] as? Int ?? -1,
                                   hold: d["hold"] as? Int ?? -1,
                                   period: d["period"] as? String ?? "none",
                                   strongBuy: d["strongBuy"] as? Int ?? -1,
                                   strongSell: d["strongSell"] as? Int ?? -1,
                                   sum: d["sum"] as? Int ?? -1,
                                   hasReddit: d["hasReddit"] as? Bool ?? false,
                                   redditTime: d["redditTime"] as? String ?? "none",
                                   redditMention: d["redditMention"] as? Int ?? -1,
                                   redditPosMention: d["redditPosMention"] as? Int ?? -1,
                                   redditNegMention: d["redditNegMention"] as? Int ?? -1,
                                   redditPosScore: d["redditPosScore"] as? Float ?? -1,
                                   redditNegScore: d["redditNegScore"] as? Float ?? -1,
                                   redditScore: d["redditScore"] as? Float ?? -1,
                                   hasTwitter: d["hasTwitter"] as? Bool ?? false,
                                   twitterTime: d["twitterTime"] as? String ?? "none",
                                   twitterMention: d["twitterMention"] as? Int ?? -1,
                                   twitterPosMention: d["twitterPosMention"] as? Int ?? -1,
                                   twitterNegMention: d["twitterNegMention"] as? Int ?? -1,
                                   twitterPosScore: d["twitterPosScore"] as? Float ?? -1,
                                   twitterNegScore: d["twitterNegScore"] as? Float ?? -1,
                                   twitterScore: d["twitterScore"] as? Float ?? -1)
              }
            }
    }
    
    // somehow this doesn't work
//    db.collection("companies").getDocuments() { (querySnapshot, err) in
//        if let err = err {
//            print("Error getting documents: \(err)")
//        } else {
//            for document in querySnapshot!.documents {
//                print("\(document.documentID) => \(document.data())")
//            }
//        }
//    }
  
  }
  
  func search(searchText: String) {
      self.filteredCompanies = self.companies.filter { company in
        return company.ticker.lowercased().contains(searchText.lowercased()) ||
          company.name.lowercased().contains(searchText.lowercased())
      }
  }
  
  func follow() {
    print("waiting to be implemented and possibly not in this class")
  }
}

struct recommendation: Identifiable {
  let buy: Int
  let hold: Int
  let period: String
  let sell: Int
  let strongBuy: Int
  let strongSell: Int
  var id = UUID()
}

struct companyData: Identifiable {
  let exchange: String
  let marketCap: Float
  let name: String
  let sharesOutstanding: Float
  let ticker: String
  let logo: String
  let industry: String
  
  let hasRecommendation: Bool
  let buy: Int
  let sell: Int
  let hold: Int
  let period: String
  let strongBuy: Int
  let strongSell: Int
  let sum: Int
  
  let hasReddit: Bool
  let redditTime: String
  let redditMention: Int
  let redditPosMention: Int
  let redditNegMention: Int
  let redditPosScore: Float
  let redditNegScore: Float
  let redditScore: Float
  
  let hasTwitter: Bool
  let twitterTime: String
  let twitterMention: Int
  let twitterPosMention: Int
  let twitterNegMention: Int
  let twitterPosScore: Float
  let twitterNegScore: Float
  let twitterScore: Float
  
  var id = UUID()
}





