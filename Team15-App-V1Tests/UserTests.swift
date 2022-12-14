//
//  UserTests.swift
//  Team15-App-V1Tests
//
//  Created by Edward Chen on 12/14/22.
//

import Foundation
@testable import Team15_App_V1

class FeedTests: XCTestCase {
  
  func testInit() {
    let user = User(name: "Yoseph", logged_in: true)
    XCTAssertNotNil(user)
    XCTAssertTrue(user.name == "Yoseph")
    XCTAssertTrue(user.logged_in == true)
    
    XCTAssertFalse(user.name == "Joseph")
    XCTAssertFalse(user.logged_in == false)
  }
  

}
