//
//  UpdatesInitTests.swift
//  Team15-App-V1Tests
//
//  Created by Edward Chen on 12/14/22.
//

import Foundation
import Firebase
@testable import Team15_App_V1

class UpdatesInitTests: XCTestCase {

  func testInit() {
    let updates: Updates = Updates()
      
    // check nil
    XCTAssertNotNil(updates.transactions)
    XCTAssertNotNil(updates.searchText)
    XCTAssertNotNil(updates.filteredTransactions)
    XCTAssertNotNil(updates.storyTransactions)
    XCTAssertNotNil(updates.filteredStoryTransactions)
    
    // check type
    XCTAssertTrue(updates.transactions.first == Transaction)
    XCTAssertTrue(updates.filteredTransactions.first == Transaction)
    XCTAssertTrue(updates.storyTransactions.first == StoryUpdates)
    XCTAssertTrue(updates.filteredStoryTransactions.first == StoryUpdates)
    XCTAssertTrue(updates.searchText == String)
    XCTAssertFalse(updates.transactions.first == StoryUpdates)
    XCTAssertFalse(updates.filteredTransactions.first == StoryUpdates)
    XCTAssertFalse(updates.storyTransactions.first == Transaction)
    XCTAssertFalse(updates.filteredStoryTransactions.first == Transaction)
    XCTAssertFalse(updates.searchText == Int)
    
    XCTAssertTrue(updates.transactions.count > 0)
    XCTAssertTrue(updates.filteredTransactions.count >= 0)
    XCTAssertTrue(updates.storyTransactions.count > 0)
    XCTAssertTrue(updates.filteredStoryTransactions.count >= 0)
    
  }
  
  func testSearch(){
    let updates: Updates = Updates()
    let searchText = "AA"
    let updateAmount = updateAmount(securityTitle: "Apple", transactionDate: "20221207", shares: 123, pricePerShare: 75.14, action: "A", sharesOwned: 130, id: 1)
    
    let transaction = Transaction(filedAt: "20221212", issuer: "Apple Inc", symbol: "AAPL", ownerName: "Tim Cook", isDirector: false, isOfficer: true, officerTitle: "CEO", nonDerivative: [updateAmount], derivative: [updateAmount], id: 1)
    updates.transactions = []
    updates.transactions.append(transaction)
    
    updates.search(searchText)
    updates.searchText = searchText
    XCTAssertTrue(updates.searchText == searchText)
    XCTAssertTrue(updates.filteredTransactions.count == 1)
    XCTAssertTrue(updates.filteredTransactions.first == transaction)
    XCTAssertTrue(updates.filteredTransactions.first.filedAt == "20221212")
    XCTAssertTrue(updates.filteredTransactions.first.symbol == "AAPL")
    
    XCTAssertFalse(updates.filteredTransactions.first.symbol == "TSLA")
    XCTAssertFalse(updates.filteredTransactions.first.ownerName == "Tim Duncan")
  }
  
  func testSVG(){
    let updates: Updates = Updates()
    let imageUrl1 = "sdfdf"
    let imageUrl2 = "svg"
    let imageUrl3 = ".svg"
    let imageUrl4 = "picture.svg"
    
    XCTAssertTrue(updates.notSVG(imageUrl1) == true)
    XCTAssertTrue(updates.notSVG(imageUrl2) == true)
    XCTAssertTrue(updates.notSVG(imageUrl3) == false)
    XCTAssertTrue(updates.notSVG(imageUrl4) == false)
    
    XCTAssertFalse(updates.notSVG(imageUrl1) == false)
    XCTAssertFalse(updates.notSVG(imageUrl4) == true)
  }
  
  func testStorySearch(){
    let updates: Updates = Updates()
    let storyTransaction = StoryTransactions(change: 1, fileDate: "20221201", name: "Apple", share: 2, transactionDate: "20221202", transactionCode: "A", transactionPrice: 157)
    
    // good story update
    let storyUpdate: StoryUpdates = StoryUpdates(name: "AAPL", url: "random.png", seen: false, proPic: "", loading: false, transactions: [storyTransaction])
    
    // bad story update
    let storyUpdate1: StoryUpdates = StoryUpdates(name: "AAPL", url: "random.png", seen: false, proPic: "not empty", loading: false, transactions: [storyTransaction])
    let storyUpdate2: StoryUpdates = StoryUpdates(name: "AAPL", url: "random.png", seen: false, proPic: "", loading: false, transactions: [])
    let storyUpdate3: StoryUpdates = StoryUpdates(name: "AAPL", url: "random.svg", seen: false, proPic: "", loading: false, transactions: [storyTransaction])
    
    updates.storyTransactions = []
    updates.filteredStoryTransactions = []
    updates.storyTransactions.append(storyUpdate)
    updates.filterStories()
    
    XCTAssertTrue(updates.filteredStoryTransactions.count == 1)
    XCTAssertTrue(updates.filteredStoryTransactions.first == storyUpdate)
    
    // bad story update test 1
    updates.storyTransactions = []
    updates.filteredStoryTransactions = []
    updates.storyTransactions.append(storyUpdate1)
    updates.filterStories()
    XCTAssertTrue(updates.filteredStoryTransactions.count == 0)
    
    // bad story update test 2
    updates.storyTransactions = []
    updates.filteredStoryTransactions = []
    updates.storyTransactions.append(storyUpdate2)
    updates.filterStories()
    XCTAssertTrue(updates.filteredStoryTransactions.count == 0)
    
    // bad story update test 3
    updates.storyTransactions = []
    updates.filteredStoryTransactions = []
    updates.storyTransactions.append(storyUpdate1)
    updates.filterStories()
    XCTAssertTrue(updates.filteredStoryTransactions.count == 0)
  }
  
  func testEditDate(){
    let updates: Updates = Updates()
    
    let date1: String = "2022--20222022"
    let date2: String = "2022"
    let date3: String = ""
    
    let result1 = updates.editDate(date1)
    let result2 = updates.editDate(date2)
    let result3 = updates.editDate(date3)
    
    XCTAssertTrue(updates.editDate(date1) == "2022--2022")
    XCTAssertTrue(updates.editDate(date2) == "2022")
    XCTAssertTrue(updates.editDate(date3) == "")
  }

  func testEditDollars(){
    let updates: Updates = Updates()
    
    let dollar1 = 0
    let dollar2 = 34
    let dollar3 = 34839234
    XCTAssertTrue(updates.editDollars(dollar1) == "$0")
    XCTAssertTrue(updates.editDate(dollar2) == "$34")
    XCTAssertTrue(updates.editDate(dollar3) == "$34,839,234")
  }
  
  func testGetTransaction(){
    let updates: Updates = Updates()
    
    let updateAmount = updateAmount(securityTitle: "Apple", transactionDate: "20221207", shares: 123, pricePerShare: 75.14, action: "A", sharesOwned: 130, id: 1)
    let transaction1 = Transaction(filedAt: "20221212", issuer: "Apple Inc", symbol: "AAPL", ownerName: "Tim Cook", isDirector: false, isOfficer: true, officerTitle: "CEO", nonDerivative: [updateAmount], derivative: [updateAmount], id: 1)
    let transaction2 = Transaction(filedAt: "20221213", issuer: "Tesla", symbol: "TSLA", ownerName: "Yilong Ma", isDirector: false, isOfficer: true, officerTitle: "CEO", nonDerivative: [updateAmount], derivative: [updateAmount], id: 2)
    let transaction3 = Transaction(filedAt: "20221214", issuer: "Microsoft", symbol: "MSFT", ownerName: "Bill Gates", isDirector: false, isOfficer: true, officerTitle: "CEO", nonDerivative: [updateAmount], derivative: [updateAmount], id: 3)
    
    XCTAssertTrue(updates.getTransaction(1) == transaction1)
    XCTAssertTrue(updates.getTransaction(2) == transaction2)
    XCTAssertTrue(updates.getTransaction(3) == transaction3)
  }
}
