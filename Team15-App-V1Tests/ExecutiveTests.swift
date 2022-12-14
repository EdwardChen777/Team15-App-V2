//
//  ExecutiveTests.swift
//  Team15-App-V1Tests
//
//  Created by Edward Chen on 12/14/22.
//

import Foundation
import Firebase
@testable import Team15_App_V1

class ExecutiveTests: XCTestCase {
  
  func testInit() {
    let executive: Executives = Executives()
    
    // check nil
    XCTAssertNotNil(executive.executives)
    XCTAssertNotNil(executive.searchText)
    XCTAssertNotNil(executive.filteredExecutives)
    
    // check type
    XCTAssertTrue(executive.executives.first == executiveData)
    XCTAssertTrue(executive.filteredExecutives.first == executiveData)
    XCTAssertTrue(executive.searchText == String)
    XCTAssertFalse(executive.executives.first == StoryUpdates)
    XCTAssertFalse(executive.filteredExecutives.first == StoryUpdates)
    
    XCTAssertTrue(executive.executives.count > 0)
    XCTAssertTrue(executive.filteredExecutives.count >= 0)
  }
  
  func testFollow(){
    let executiveName = "Tim Can Cook"
    let executive = Executives()
    let signUpController = SignUpController(isLoggedin: true, needOnboarding: true, isNewUser: true)
    
    executive.follow(name: executiveName, controller: signUpController)
    XCTAssertTrue(signUpController.execFollowing.contains(executiveName) == true)
    XCTAssertFalse(signUpController.execFollowing.contains(executiveName) == false)
  }
  
  func testUnfollow(){
    let executiveName = "Can Tim Cook?"
    let executive = Executives()
    let signUpController = SignUpController(isLoggedin: true, needOnboarding: true, isNewUser: true)
    signUpController.execFollowing.append(executiveName)
    
    executive.unfollow(name: executiveName, controller: signUpController)
    XCTAssertTrue(signUpController.execFollowing.contains(executiveName) == false)
    XCTAssertFalse(signUpController.execFollowing.contains(executiveName) == true)
  }
  
  func testExecutiveData() {
    let data = executiveData(execId: "1", cik: "343134dfd", ticker: "BABA", name: "Alibaba", position: "Chair of Chairs", year: 2022, salary: 100000, bonus: 1, stockAwards: 2, optionAwards: 3, nonEquityCompensation: 4, otherCompensation: 5, total: 100015, id: 1)
    
    XCTAssertNotNil(data)
    XCTAssertTrue(data.execId == "1")
    XCTAssertTrue(data.cik == "343134dfd")
    XCTAssertTrue(data.ticker == "BABA")
    XCTAssertTrue(data.id == 1)
    
    XCTAssertFalse(data.bonus == 2)
    XCTAssertFalse(data.total == 1000)
    
    XCTAssertTrue(data.position == String)
    XCTAssertTrue(data.year == Int)
  }
}
