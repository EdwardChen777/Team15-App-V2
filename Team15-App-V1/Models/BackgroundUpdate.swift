//
//  Updates.swift
//  Team15-App-V1
//
//  Created by Edward Chen on 11/8/22.
//

import Foundation
import Firebase
import BackgroundTasks

class ApiFetch: ObservableObject {
  init() {
    // define the API request
    let sec_api_key = "ec5d36984349cb27b4707959304eb10a769d0026c9b56dde1c25fa3a76dbb02d"
    let sec_url = URL(string: "https://api.sec-api.io/insider-trading")!
    var sec_request = URLRequest(url: sec_url)
    sec_request.httpMethod = "POST"
    sec_request.addValue(sec_api_key, forHTTPHeaderField: "Authorization")
  
    // set background session configuration
//    let config = URLSessionConfiguration.background(withIdentifier: "refresh")
//    config.sessionSendsLaunchEvents = true
//    let session = URLSession(configuration: config)
  
    let sec = URLSession.shared.dataTask(with: sec_request) { (data, response, error) in
      guard let sec_data = try? data else {
        print("Error: No data to decode")
        return
      }
      do {
        var filedAt = ""
        var issuer = ""
        var symbol = ""
        var ownerName = ""
        var isDirector = false
        var isOfficer = false
        var officerTitle = ""
        var nonDerivative = []
        var derivative = []
        let sec_list = try JSONDecoder().decode(SECTransactions.self, from: sec_data)
        
          // decode each transaction
          for value in sec_list.transactions {
            filedAt = value.filedAt
            if let issuers = value.issuer {
              issuer = issuers.name ?? "none"
              symbol = issuers.tradingSymbol ?? "none"
            }
            
            // decode report owner information
            if let owners = value.reportingOwner {
              ownerName = owners.name ?? "none"
              if let relationship = owners.relationship {
                isDirector = relationship.isDirector ?? false
                isOfficer = relationship.isOfficer ?? false
                officerTitle = relationship.officerTitle ?? "none"
              }
            }
            
            // decode non-derivative tables
            if let noneDerTable = value.nonDerivativeTable {
              if let nonDerivativeTransactions = noneDerTable.transactions {
                for nonDerivativeTransaction in nonDerivativeTransactions {
                  let securityTitle = nonDerivativeTransaction.securityTitle ?? "none"
                  let transactionDate = nonDerivativeTransaction.transactionDate ?? "none"
                  var shares: Float = 0.0
                  var pricePerShare: Float = 0.0
                  var action = ""
                  var sharesOwned: Float = 0.0
                  if let amount = nonDerivativeTransaction.amounts {
                    shares = amount.shares ?? -1.0
                    pricePerShare = amount.pricePerShare ?? -1.0
                    action = amount.acquiredDisposedCode ?? "none"
                  }
                  if let post = nonDerivativeTransaction.postTransactionAmounts {
                    sharesOwned = post.sharesOwnedFollowingTransaction ?? -1.0
                  }
//                  let detail = updateAmount(securityTitle: securityTitle, transactionDate: transactionDate, shares: shares, pricePerShare: pricePerShare, action: action, sharesOwned: sharesOwned)
                  var detail = ["securityTitle": securityTitle, "transactionDate": transactionDate, "shares": shares, "pricePerShare": pricePerShare, "action": action, "sharesOwned": sharesOwned]
                  nonDerivative.append(detail)
                }
              }
            }
            
            // decode derivative table
            if let derTable = value.derivativeTable {
              if let derivativeTransactions = derTable.transactions {
                for derivativeTransaction in derivativeTransactions {
                  var securityTitle = derivativeTransaction.securityTitle ?? "none"
                  var transactionDate = ""
                  var shares: Float = 0.0
                  var pricePerShare: Float = 0.0
                  var action = ""
                  var sharesOwned: Float = 0.0
                  if let amount = derivativeTransaction.amounts {
                    shares = amount.shares ?? -1.0
                    pricePerShare = amount.pricePerShare ?? -1.0
                    action = amount.acquiredDisposedCode ?? "none"
                  }
                  if let post = derivativeTransaction.postTransactionAmounts {
                    sharesOwned = post.sharesOwnedFollowingTransaction ?? -1.0
                  }
                  // create the sub object
                  let detail = ["securityTitle": securityTitle, "transactionDate": transactionDate, "shares": shares, "pricePerShare": pricePerShare, "action": action, "sharesOwned": sharesOwned]
                  derivative.append(detail)
                }
              }
            }
            
          // add to firebase database
//          var updateItem = updateData(filedAt: filedAt, issuer: issuer, symbol: symbol, ownerName: ownerName, isDirector: isDirector, isOfficer: isOfficer, officerTitle: officerTitle, nonDerivative: nonDerivative, derivative: derivative)
//          results.append(updateItem)
            
            // transfer variable value to a constant variable or else all the values would be the same for some reason
            let constFiledAt = filedAt
            let constIssuer = issuer
            let constSymbol = symbol
            let constOwnerName = ownerName
            let constIsDirector = isDirector
            let constIsOfficer = isOfficer
            let constOfficerTitle = officerTitle
            let constNonDerivative = nonDerivative
            let constDerivative = derivative
            
            let db = Firestore.firestore()
            
//             check if collection already exists by comparing filedAt
            let docRef = db.collection("transactions").document(filedAt)
            docRef.getDocument { (document,err) in
//              print(constFiledAt)
              if let sth = document {
                if sth.exists {
                  print("Document already exists")
                } else {
                  // add new data to collection
                  db.collection("transactions").addDocument(data: ["filedAt": constFiledAt, "issuer": constIssuer, "symbol": constSymbol, "ownerName": constOwnerName, "isDirector": constIsDirector, "isOfficer": constIsOfficer, "officerTitle": constOfficerTitle, "nonDerivative": constNonDerivative, "derivative": constDerivative]) { (error) in
                    if error != nil {
                      print("Error uploading updates data")
                    }
                  }
                }
              }

            }
          
        }
      } catch {
        print("\(error)")
      }
//      DispatchQueue.main.async{
//        completionHandler(sec_list)
//      }
    }
    sec.resume()
  }
    
}


// define the class for each sub-transaction 
struct updateAmount: Identifiable {
  let securityTitle: String
  let transactionDate: String
  let shares: Float
  let pricePerShare: Float
  let action: String
  let sharesOwned: Float
  var id = UUID()
}

// define the class for each transaction
struct updateData{
  var filedAt: String
  var issuer: String
  var symbol: String

  var ownerName: String
  var isDirector: Bool
  var isOfficer: Bool
  var officerTitle: String

  var nonDerivative: [updateAmount]
  var derivative: [updateAmount]
}


struct SECTransactions: Codable {
  let transactions: [SECTransaction]

  enum CodingKeys : String, CodingKey {
    case transactions
  }

}

struct SECTransaction: Identifiable, Codable {
  var id  = UUID()
  let filedAt: String
  let issuer: Issuer?
  let dateOfOriginalSubmission: String?
  let reportingOwner: ReportingOwner?
  let nonDerivativeTable: NonDerivativeTable?
  let derivativeTable: DerivativeTable?
  let footnotes: [Footnote]?
  let remarks: String?

  enum CodingKeys : String, CodingKey {
    case filedAt
    case issuer
    case dateOfOriginalSubmission
    case reportingOwner
    case nonDerivativeTable
    case derivativeTable
    case footnotes
    case remarks
  }
}

struct Issuer: Codable {
  let name: String?
  let tradingSymbol: String?
  
  enum CodingKeys : String, CodingKey {
    case name
    case tradingSymbol
  }
}

struct ReportingOwner: Codable {
  let name: String?
  let relationship: Relationship?
  
  enum CodingKeys: String, CodingKey {
    case name
    case relationship
  }
}

struct Relationship: Codable {
  let isDirector: Bool?
  let isOfficer: Bool?
  let officerTitle: String?
  let isTenPercentOwner: Bool?
  let isOther: Bool?
  let otherText: String?
  
  enum CodingKeys: String, CodingKey {
    case isDirector
    case isOfficer
    case officerTitle
    case isTenPercentOwner
    case isOther
    case otherText
  }
}

struct NonDerivativeTable: Codable {
  let transactions: [SecurityTransaction]?
  let holdings: [Holdings]?
  
  enum CodingKeys: String, CodingKey {
    case transactions
    case holdings
  }
}

struct DerivativeTable: Codable {
  let transactions: [SecurityTransaction]?
  let holdings: [Holdings]?
  
  enum CodingKeys: String, CodingKey {
    case transactions
    case holdings
  }
}

struct SecurityTransaction: Codable {
  let securityTitle: String?
  let transactionDate: String?
  let deemedExecutionDate: String?
  let coding: Coding?
  let timeliness: String?
  let amounts: Amounts?
  let postTransactionAmounts: PostTransactionAmounts?
  let ownershipNature: OwnershipNature?
  
  enum CodingKeys: String, CodingKey {
    case securityTitle
    case transactionDate
    case deemedExecutionDate
    case coding
    case timeliness
    case amounts
    case postTransactionAmounts
    case ownershipNature
  }
}

struct Coding: Codable {
  let formType: String?
  let code: String?
  let equitySwapInvolved: Bool?
  
  enum CodingKeys: String, CodingKey {
    case formType
    case code
    case equitySwapInvolved
  }
}

struct Amounts: Codable {
  let shares: Float?
  let pricePerShare: Float?
  let acquiredDisposedCode: String?
  
  enum CodingKeys: String, CodingKey {
    case shares
    case pricePerShare
    case acquiredDisposedCode
  }
}

struct PostTransactionAmounts: Codable {
  let sharesOwnedFollowingTransaction: Float?
  let valueOwnedFollowingTransaction: Float?
  
  enum CodingKeys: String, CodingKey {
    case sharesOwnedFollowingTransaction
    case valueOwnedFollowingTransaction
  }
}

struct OwnershipNature: Codable {
  let directOrIndirectOwnership: String?
  let natureOfOwnership: String?
  
  enum CodingKeys: String, CodingKey {
    case directOrIndirectOwnership
    case natureOfOwnership
  }
}

struct Holdings: Codable {
  let securityTitle: String?
  let coding: Coding?
  let postTransactionAmounts: PostTransactionAmounts?
  let ownershipNautre: OwnershipNature?
  
  enum CodingKeys: String, CodingKey {
    case securityTitle
    case coding
    case postTransactionAmounts
    case ownershipNautre
  }
}

struct Footnote: Identifiable, Codable {
  var id  = UUID()
  let text: String?
  
  enum CodingKeys: String, CodingKey {
    case text
  }
}
