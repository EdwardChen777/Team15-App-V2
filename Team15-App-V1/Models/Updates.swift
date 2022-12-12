//
//  Updates.swift
//  Team15-App-V1
//
//  Created by Edward Chen on 11/8/22.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

// fetch data from firebase and put in the updates object

class Updates: ObservableObject {
    @Published var transactions: [Transaction] = []
    @Published var searchText : String = ""
    @Published var filteredTransactions: [Transaction] = []
    @Published var storyTransactions: [StoryUpdates] = []
    @Published var filteredStoryTransactions: [StoryUpdates] = []
    
  // retrieve data from firebase
  init() {
    let db = Firestore.firestore()
//    let docRef = db.collection("transactions").document()
    
    db.collection("companies").getDocuments {snapshot, err in
      if err == nil {
        if let snapshot = snapshot {
          self.storyTransactions = snapshot.documents.map { d in
//            print("hi im here")
            var storyTrans = [StoryTransactions]()
            if let dbTrans = d["transactions"] as? [Any] {
              for dbTran in dbTrans {
                if let subTrans = dbTran as? [String: Any] {
                  let change = subTrans["change"] as? Int ?? 0
                  let fileDate = subTrans["fileDate"] as? String ?? "none"
                  let name = subTrans["name"] as? String ?? "none"
                  let share = subTrans["share"] as? Int ?? 0
                  let transactionCode = subTrans["transactionCode"] as? String ?? "none"
                  let transactionDate = subTrans["transactionDate"] as? String ?? "none"
                  let transactionPrice = subTrans["transactionPrice"] as? Float ?? 0.0
                  storyTrans.append(StoryTransactions(change: change, fileDate: fileDate, name: name, share: share, transactionDate: transactionDate, transactionCode: transactionCode, transactionPrice: transactionPrice))
                }
              }
            }
            let name = d["name"] as? String ?? "none"
            let proPic = d["logo"] as? String ?? "none"

            return StoryUpdates(name: name, url: proPic, seen: false, proPic: proPic, loading: false, transactions: storyTrans)
          }
          
          self.filteredStoryTransactions = snapshot.documents.map { d in
            print("hi im here")
            var storyTrans = [StoryTransactions]()
            if let dbTrans = d["transactions"] as? [Any] {
              for dbTran in dbTrans {
                if let subTrans = dbTran as? [String: Any] {
                  let change = subTrans["change"] as? Int ?? 0
                  let fileDate = subTrans["fileDate"] as? String ?? "none"
                  let name = subTrans["name"] as? String ?? "none"
                  let share = subTrans["share"] as? Int ?? 0
                  let transactionCode = subTrans["transactionCode"] as? String ?? "none"
                  let transactionDate = subTrans["transactionDate"] as? String ?? "none"
                  let transactionPrice = subTrans["transactionPrice"] as? Float ?? 0.0
                  storyTrans.append(StoryTransactions(change: change, fileDate: fileDate, name: name, share: share, transactionDate: transactionDate, transactionCode: transactionCode, transactionPrice: transactionPrice))
                }
              }
            }
            let name = d["name"] as? String ?? "none"
            let proPic = d["logo"] as? String ?? "none"

            return StoryUpdates(name: name, url: proPic, seen: false, proPic: proPic, loading: false, transactions: storyTrans)
          }
          self.filteredStoryTransactions = self.storyTransactions.filter { story in
            return !story.proPic.isEmpty && story.transactions.count > 0  && self.notSVG(image: story.proPic)
          }
          
        }
      }
      
    }
    
    
    
    // need to query the database twice
    db.collection("transactions").getDocuments {snapshot, err in
      if err == nil {
        if let snapshot = snapshot {
          self.transactions = snapshot.documents.map { d in

            var der = [updateAmount]()
            var nonDer = [updateAmount]()
            if let derivative = d["derivative"] as? [Any] {

              for subDerivative in derivative {
                if let subDer = subDerivative as? [String: Any] {
                  let securityTitle = subDer["securityTitle"] as? String ?? "none"
                  let transactionDate = subDer["transactionDate"] as? String ?? "none"
                  let shares = subDer["shares"] as? Float ?? 0.0
                  let pricePerShare = subDer["pricePerShare"] as? Float ?? 0.0
                  let action = subDer["action"] as? String ?? "none"
                  let sharesOwned = subDer["sharesOwned"] as? Float ?? 0.0
                  der.append(updateAmount(securityTitle: securityTitle, transactionDate: transactionDate, shares: shares, pricePerShare: pricePerShare, action: action, sharesOwned: sharesOwned))
                }
              }
            }
            
            if let nonDerivative = d["nonDerivative"] as? [Any] {
              for subNonDerivative in nonDerivative {
                if let subNonDer = subNonDerivative as? [String: Any] {
                  let securityTitle = subNonDer["securityTitle"] as? String ?? "none"
                  let transactionDate = subNonDer["transactionDate"] as? String ?? "none"
                  let shares = subNonDer["shares"] as? Float ?? 0.0
                  let pricePerShare = subNonDer["pricePerShare"] as? Float ?? 0.0
                  let action = subNonDer["action"] as? String ?? "none"
                  let sharesOwned = subNonDer["sharesOwned"] as? Float ?? 0.0
                  nonDer.append(updateAmount(securityTitle: securityTitle, transactionDate: transactionDate, shares: shares, pricePerShare: pricePerShare, action: action, sharesOwned: sharesOwned))
                }
              }
            }
            
            var date = d["filedAt"] as? String ?? "none"
            if (date != "none") {
              date = String(date.prefix(10))
            }
            return Transaction(filedAt: date,
                               issuer: d["issuer"] as? String ?? "none",
                               symbol: d["symbol"] as? String ?? "none",
                               ownerName: d["ownerName"] as? String ?? "Unknown",
                               isDirector: d["isDirector"] as? Bool ?? false,
                               isOfficer: d["isOfficer"] as? Bool ?? false,
                               officerTitle: d["officerTitle"] as? String ?? "none",
                               nonDerivative: der,
                               derivative: nonDer)
          }

        }
      }
    }
  
  }
  
  
  // search for companies/symbols/owner name
  func search(searchText: String) {
      self.filteredTransactions = self.transactions.filter { transaction in
        return transaction.symbol.lowercased().contains(searchText.lowercased())
      }
  }
  
  func filterStories() {
      self.filteredStoryTransactions = self.storyTransactions.filter { story in
        return story.proPic.isEmpty && story.transactions.count > 0 && notSVG(image: story.proPic)
      }
  }
  
  // Removed SVG images because very hard to implement in Swift
  func notSVG(image: String) -> Bool {
    return !image.contains(".svg")
  }
  

  func editDate(date: String) -> String {
    let formatted_date = date.prefix(10)
    return String(formatted_date)
  }
  
  func getMostRecentDate() -> Date {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy/MM/dd"
    var most_recent_date = dateFormatter.date(from: "1970/01/01")
    for transaction in transactions {
      let editedDate = editDate(date: transaction.filedAt)
      let sampleDate = dateFormatter.date(from: editedDate)
      if most_recent_date! < sampleDate! {
        most_recent_date = sampleDate
      }
    }
    return most_recent_date!
  }
  
  func getTodayTransactionCount() -> Int {
    let date = getMostRecentDate()
    
    var transaction_count = 0
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy/MM/dd"
    for transaction in transactions {
      let transaction_date = dateFormatter.date(from: editDate(date: transaction.filedAt))
      if transaction_date  == date {
        transaction_count = transaction_count + 1
      }
    }
    
    return transaction_count
  }
  
  func editDollars(dollarInt: Int) -> String {
    var format = NumberFormatter()
    format.groupingSeparator = ","
    format.groupingSize = 3
    format.usesGroupingSeparator = true
    var dollar = format.string(from: dollarInt as NSNumber)!
    return "$" + dollar
  }
  
  func getTodayTradeVolume(transactions: [Transaction]) -> String {
    let date = getMostRecentDate()
    
    var trade_volume = 0
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy/MM/dd"
    for transaction in transactions {
      let transaction_date = dateFormatter.date(from: editDate(date: transaction.filedAt))
      if transaction_date == date {
        for item in transaction.derivative {
          trade_volume = trade_volume + Int((item.pricePerShare*item.shares))
        }
        for item in transaction.nonDerivative {
          trade_volume = trade_volume + Int((item.pricePerShare*item.shares))
        }
      }
    }
    return editDollars(dollarInt: trade_volume)
  }
  
  func getTodayHotStock() -> String {
    let date = getMostRecentDate()
    var Stock_Trade = [String: Int]()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy/MM/dd"
    for transaction in transactions {
      let transaction_date = dateFormatter.date(from: editDate(date: transaction.filedAt))
      if transaction_date == date {
        var amount1 = 0
        var amount2 = 0
        for item in transaction.derivative {
          amount1 = Int((item.pricePerShare*item.shares))
        }
        for item in transaction.nonDerivative {
          amount2 = Int((item.pricePerShare*item.shares))
        }
        if Stock_Trade.keys.contains(transaction.symbol) {
          Stock_Trade[transaction.symbol] = Stock_Trade[transaction.symbol]! + amount1 + amount2
        } else {
          Stock_Trade[transaction.symbol] = amount1 + amount2
        }
      }
    }
    return Stock_Trade.max { $0.value < $1.value }!.key
  }

  func getTransaction(id: UUID) -> Transaction {
    return self.transactions.first(where: { $0.id == id })!

  }
}

struct Transaction: Identifiable {
  let filedAt: String
  let issuer: String
  let symbol: String

  let ownerName: String
  let isDirector: Bool
  let isOfficer: Bool
  let officerTitle: String

  let nonDerivative: [updateAmount]
  let derivative: [updateAmount]
  var id = UUID()
}

struct TransactionAmount: Identifiable {
  let securityTitle: String
  let transactionDate: String
  let shares: Float
  let pricePerShare: Float
  let action: String
  let sharesOwned: Float
  var id = UUID()
}


struct StoryUpdates: Identifiable{
  let id = UUID()
  let name : String
  let url : String
  var seen : Bool
  let proPic : String
  var loading : Bool
  let transactions : [StoryTransactions]
  
  // add update body data
//  static func <(lhs: StoryUpdates, rhs: StoryUpdates) -> Bool {
//    return lhs.seen < rhs.seen
//  }
}

struct StoryTransactions: Identifiable{
  let id = UUID()
  let change : Int
  let fileDate : String
  let name : String
  let share : Int
  let transactionDate : String
  let transactionCode : String
  let transactionPrice : Float
}
