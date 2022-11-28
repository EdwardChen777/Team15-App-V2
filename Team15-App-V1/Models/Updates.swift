//
//  Updates.swift
//  Team15-App-V1
//
//  Created by Edward Chen on 11/8/22.
//

import Foundation
import Firebase
//import FirebaseFirestore
import FirebaseFirestoreSwift

// fetch data from firebase and put in the updates object

class Updates: ObservableObject {
    @Published var transactions: [Transaction] = []
    @Published var searchText : String = ""
    @Published var filteredTransactions: [Transaction] = []
    
  // retrieve data from firebase
  init() {
    let db = Firestore.firestore()
//    let docRef = db.collection("transactions").document()
    
    // need to query the database twice
    db.collection("transactions").getDocuments {snapshot, err in
      if err == nil {
        if let snapshot = snapshot {
          self.transactions = snapshot.documents.map { d in
//            print(d["filedAt"])
//            print(d["derivative"]["action"])
//            let identity = d["filedAt"] as? String ?? "none"
//            var der = [updateAmount]()
//            var nonDer = [updateAmount]()
//            print("im here")
//            // retrieve the derivative subcollection
//            db.collection("transactions").document(identity).collection("derivative").addSnapshotListener {(querySnapshot, err) in
//              print("im in the first layer")
//                guard let derDoc = querySnapshot?.documents else {
//                  print("no messages found")
//                  return
//                }
////              print(derDoc.first)
//              der = derDoc.map { e in
//                let action = e["action"] as? String ?? "none"
//                let pricePerShare = e["pricePerShare"] as? Float ?? 0.0
//                let securityTitle = e["securityTitle"] as? String ?? "none"
//                let shares = e["shares"] as? Float ?? 0.0
//                let sharesOwned = e["sharesOwned"] as? Float ?? 0.0
//                let transactionDate = e["transactionDate"] as? String ?? "none"
//                print("im inside")
//                print(transactionDate)
//                return updateAmount(securityTitle: securityTitle, transactionDate: transactionDate, shares: shares, pricePerShare: pricePerShare, action: action, sharesOwned: sharesOwned)
//              }
//            }
//
//            // retrieve the nonDerivative subcollection
//            db.collection("transactions").document(identity).collection("nonDerivative").addSnapshotListener { (querySnapshot, err) in
//              guard let derDoc = querySnapshot?.documents else {
//                print("no messages found")
//                return
//              }
//
//              nonDer = derDoc.map { e in
//                let action = e["action"] as? String ?? "none"
//                let pricePerShare = e["pricePerShare"] as? Float ?? 0.0
//                let securityTitle = e["securityTitle"] as? String ?? "none"
//                let shares = e["shares"] as? Float ?? 0.0
//                let sharesOwned = e["sharesOwned"] as? Float ?? 0.0
//                let transactionDate = e["transactionDate"] as? String ?? "none"
//                return updateAmount(securityTitle: securityTitle, transactionDate: transactionDate, shares: shares, pricePerShare: pricePerShare, action: action, sharesOwned: sharesOwned)
//              }
//            }
            var der = [updateAmount]()
            var nonDer = [updateAmount]()
            if let derivative = d["derivative"] as? [Any] {
//              derivative.map { e in
//                return updateAmount(securityTitle: e["securityTitle"], transactionDate: e["transactionDate"], shares: e["shares"], pricePerShare: e["pricePerShare"], action: e["action"], sharesOwned: e["sharesOwned"])
//              }
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
            
            
            return Transaction(filedAt: d["filedAt"] as? String ?? "none",
                               issuer: d["issuer"] as? String ?? "none",
                               symbol: d["symbol"] as? String ?? "none",
                               ownerName: d["ownerName"] as? String ?? "none",
                               isDirector: d["isDirector"] as? Bool ?? false,
                               isOfficer: d["isOfficer"] as? Bool ?? false,
                               officerTitle: d["officerTitle"] as? String ?? "none",
                               nonDerivative: der,
                               derivative: nonDer)
          }
//          for document in snapshot!.documents {
//            self.transactions.append(Transaction(filedAt: document.filedAt, issuer: document.issuer, symbol: document.symbol, ownerName: document.ownerName, isDirector: document.isDirector, isOfficer: document.isOfficer, officerTitle: document.officerTitle, nonDerivative: document.nonDerivative, derivative: document.derivative))
//          }
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



//class Updates: ObservableObject {
////  var temp: SECTransactions.transactions
//  @Published var transactions: [updateData] = []
//  @Published var searchText : String = ""
//  @Published var filteredTransactions: [updateData] = []
//  
//  init() {
//    let sec_api_key = "f57f12ef4f43516893e1be7e897aaba48770a14d48c1b683996eb9594a008656"
//
//    let sec_url = URL(string: "https://api.sec-api.io/insider-trading")!
//    var sec_request = URLRequest(url: sec_url)
//    sec_request.httpMethod = "POST"
//    sec_request.addValue(sec_api_key, forHTTPHeaderField: "Authorization")
//    
//    let sec = URLSession.shared.dataTask(with: sec_request) { (data, response, error) in
//      guard let sec_data = data else {
//        print("Error: No data to decode")
//        return
//      }
//      
//      // Decode the JSON here
//    //  guard let sec_list = try? JSONDecoder().decode(SECTransactions.self, from: sec_data) else {
//    //    print("Error: Couldn't decode data into a result")
//    //    return
//    //  }
//      
//      do {
//        let sec_list = try JSONDecoder().decode(SECTransactions.self, from: sec_data)
//        let temp = sec_list.transactions
//        for value in temp {
//          let filedAt = value.filedAt
//          // need to unwrap
////          let symbol = value.issuer?.tradingSymbol
////          var symbol = value.issuer.tradingSymbol ?? ""
////          let shares = 0
////          let pricePerShare = 0
////          if let issuer = value.issuer {
////            let symbol = issuer.tradingSymbol
////          } else {
////            let symbol = ""
////          }
//          if let derivativeTable = value.derivativeTable {
//            if let derivativeTransaction = derivativeTable.transactions {
//              if let first = derivativeTransaction.first {
//                if let amount = first.amounts {
//                  let shares = amount.shares ?? Float(0)
//                  let pricePerShare = amount.pricePerShare ?? Float(0)
//                  if let issuer = value.issuer {
//                    let symbol = issuer.tradingSymbol ?? ""
//                    self.transactions.append(updateData(filedAt: filedAt, symbol: symbol, shares: shares, pricePerShare: pricePerShare))
//                  }
//                } else {
//                  let shares = Float(0)
//                  let pricePerShare = Float(0)
//                  if let issuer = value.issuer {
//                    let symbol = issuer.tradingSymbol ?? ""
//                    self.transactions.append(updateData(filedAt: filedAt, symbol: symbol, shares: shares, pricePerShare: pricePerShare))
//                  }
//                }
//              } else {
//                let shares = Float(0)
//                let pricePerShare = Float(0)
//                if let issuer = value.issuer {
//                  let symbol = issuer.tradingSymbol ?? ""
//                  self.transactions.append(updateData(filedAt: filedAt, symbol: symbol, shares: shares, pricePerShare: pricePerShare))
//                }
//              }
//            } else {
//              let shares = Float(0)
//              let pricePerShare = Float(0)
//              if let issuer = value.issuer {
//                let symbol = issuer.tradingSymbol ?? ""
//                self.transactions.append(updateData(filedAt: filedAt, symbol: symbol, shares: shares, pricePerShare: pricePerShare))
//              } 
//            }
//          } else {
//            let shares = Float(0)
//            let pricePerShare = Float(0)
//            if let issuer = value.issuer {
//              let symbol = issuer.tradingSymbol ?? ""
//              self.transactions.append(updateData(filedAt: filedAt, symbol: symbol, shares: shares, pricePerShare: pricePerShare))
//            }
//          }
//          
////          let shares = value.derivativeTable?.transactions?.first?.amounts?.shares
////          let pricePerShare = value.derivativeTable?.transactions?.first?.amounts?.pricePerShare
////          let sharesOwned = value.derivatetiveTable?.transactions?.first.postTransactionAmounts?.sharesOwnedFollowingTransaction
////          let valueOwned = value.derivatetiveTable?.transactions?.first.postTransactionAmounts?.valueOwnedFollowingTransaction
////          self.transactions.append(updateData(String: filedAt, String: symbol, Float: shares, Float: pricePerShare, Float: sharesOwned, Float: valueOwned))
//
//        }
//      }
//      catch {
//        print("\(error)")
//      }
//    }
//    sec.resume()
//  }
//  
//  func search(searchText: String) {
//    self.filteredTransactions = self.transactions.filter { transaction in
//      return transaction.symbol.lowercased().contains(searchText.lowercased())
//    }
//  }
//}
//
//struct updateData: Identifiable{
//  var filedAt: String
//  var symbol: String
//  var shares: Float
//  var pricePerShare: Float
////  var sharesOwned: Float
////  var valueOwned: Float
//  var id = UUID()    // To conform to Identifialbe protocol
//
//  init(filedAt: String, symbol: String, shares: Float, pricePerShare: Float) {
//      self.filedAt = filedAt
//      self.symbol = symbol
//      self.shares = shares
//      self.pricePerShare = pricePerShare
////      self.sharesOwned = sharesOwned
////      self.valueOwned = valueOwned
//  }
//
//}
//
//
//struct SECTransactions: Codable {
//  let transactions: [SECTransaction]
//
//  enum CodingKeys : String, CodingKey {
//    case transactions
//  }
//
//}
//
//struct SECTransaction: Identifiable, Codable {
//  var id  = UUID()
//  let filedAt: String
//  let issuer: Issuer?
//  let dateOfOriginalSubmission: String?
//  let reportingOwner: ReportingOwner?
//  let nonDerivativeTable: NonDerivativeTable?
//  let derivativeTable: DerivativeTable?
//  let footnotes: [Footnote]?
//  let remarks: String?
//
//  enum CodingKeys : String, CodingKey {
//    case filedAt
//    case issuer
//    case dateOfOriginalSubmission
//    case reportingOwner
//    case nonDerivativeTable
//    case derivativeTable
//    case footnotes
//    case remarks
//  }
//}
//
//struct Issuer: Codable {
//  let name: String?
//  let tradingSymbol: String?
//  
//  enum CodingKeys : String, CodingKey {
//    case name
//    case tradingSymbol
//  }
//}
//
//struct ReportingOwner: Codable {
//  let name: String?
//  let relationship: Relationship?
//  
//  enum CodingKeys: String, CodingKey {
//    case name
//    case relationship
//  }
//}
//
//struct Relationship: Codable {
//  let isDirector: Bool?
//  let isOfficer: Bool?
//  let officerTitle: String?
//  let isTenPercentOwner: Bool?
//  let isOther: Bool?
//  let otherText: String?
//  
//  enum CodingKeys: String, CodingKey {
//    case isDirector
//    case isOfficer
//    case officerTitle
//    case isTenPercentOwner
//    case isOther
//    case otherText
//  }
//}
//
//struct NonDerivativeTable: Codable {
//  let transactions: [SecurityTransaction]?
//  let holdings: [Holdings]?
//  
//  enum CodingKeys: String, CodingKey {
//    case transactions
//    case holdings
//  }
//}
//
//struct DerivativeTable: Codable {
//  let transactions: [SecurityTransaction]?
//  let holdings: [Holdings]?
//  
//  enum CodingKeys: String, CodingKey {
//    case transactions
//    case holdings
//  }
//}
//
//struct SecurityTransaction: Codable {
//  let securityTitle: String?
//  let transactionDate: String?
//  let deemedExecutionDate: String?
//  let coding: Coding?
//  let timeliness: String?
//  let amounts: Amounts?
//  let postTransactionAmounts: PostTransactionAmounts?
//  let ownershipNature: OwnershipNature?
//  
//  enum CodingKeys: String, CodingKey {
//    case securityTitle
//    case transactionDate
//    case deemedExecutionDate
//    case coding
//    case timeliness
//    case amounts
//    case postTransactionAmounts
//    case ownershipNature
//  }
//}
//
//struct Coding: Codable {
//  let formType: String?
//  let code: String?
//  let equitySwapInvolved: Bool?
//  
//  enum CodingKeys: String, CodingKey {
//    case formType
//    case code
//    case equitySwapInvolved
//  }
//}
//
//struct Amounts: Codable {
//  let shares: Float?
//  let pricePerShare: Float?
//  let acquiredDisposedCode: String?
//  
//  enum CodingKeys: String, CodingKey {
//    case shares
//    case pricePerShare
//    case acquiredDisposedCode
//  }
//}
//
//struct PostTransactionAmounts: Codable {
//  let sharesOwnedFollowingTransaction: Float?
//  let valueOwnedFollowingTransaction: Float?
//  
//  enum CodingKeys: String, CodingKey {
//    case sharesOwnedFollowingTransaction
//    case valueOwnedFollowingTransaction
//  }
//}
//
//struct OwnershipNature: Codable {
//  let directOrIndirectOwnership: String?
//  let natureOfOwnership: String?
//  
//  enum CodingKeys: String, CodingKey {
//    case directOrIndirectOwnership
//    case natureOfOwnership
//  }
//}
//
//struct Holdings: Codable {
//  let securityTitle: String?
//  let coding: Coding?
//  let postTransactionAmounts: PostTransactionAmounts?
//  let ownershipNautre: OwnershipNature?
//  
//  enum CodingKeys: String, CodingKey {
//    case securityTitle
//    case coding
//    case postTransactionAmounts
//    case ownershipNautre
//  }
//}
//
//struct Footnote: Identifiable, Codable {
//  var id  = UUID()
//  let text: String?
//  
//  enum CodingKeys: String, CodingKey {
//    case text
//  }
//}
