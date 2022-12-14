//
//  ProfileTests.swift
//  Team15-App-V1Tests
//
//  Created by Edward Chen on 12/14/22.
//

import Foundation
import XCTest
@testable import Team15_App_V1

class ProfileTests: XCTestCase {
  
  func testInit() {
    let profile : Profile = Profile(firstname: "Edward", lastname: "Chen", phone_number: "1234567890", uid: 1)
    
    XCTAssertNotNil(profile)
    XCTAssertTrue(profile.firstname == "Edward")
    XCTAssertTrue(profile.lastname == "Chen")
    XCTAssertTrue(profile.phone_number == "1234567890")
    XCTAssertTrue(profile.uid == 1)
    XCTAssertFalse(profile.firstname == "Jonathan")
    XCTAssertFalse(profile.lastname == "Wellener")
  }
}
