//
//  Team15_App_V1Tests.swift
//  Team15-App-V1Tests
//
//  Created by Edward Chen on 12/13/22.
//

import XCTest
@testable import Team15_App_V1

final class Team15_App_V1Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
  
  
    func testNews() {
      
      let news = News()
      news.articles = [articleData(id: 1, link: "test", pubDate: "test", source: "test", title: "test", imageUrl: "test", rank: false),articleData(id: 2, link: "test2", pubDate: "test2", source: "test2", title: "test2", imageUrl: "test2", rank: false),articleData(id: 3, link: "test3", pubDate: "test3", source: "test3", title: "test3", imageUrl: "test3", rank: true)]
      XCTAssert(news.getArticle(id: 2) == articleData(id: 2, link: "test2", pubDate: "test2", source: "test2", title: "test2", imageUrl: "test2", rank: false))
      XCTAssertFalse(news.getArticle(id: 1) == articleData(id: 2, link: "test2", pubDate: "test2", source: "test2", title: "test2", imageUrl: "test2", rank: false))
      XCTAssertEqual(news.getArticle(id: 3), articleData(id: 3, link: "test3", pubDate: "test3", source: "test3", title: "test3", imageUrl: "test3", rank: true))
      XCTAssertNotEqual(validator.validate(email: "lorem ipsum dolor sit amet"), true)
    }

//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        // Any test you write for XCTest can be annotated as throws and async.
//        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
//        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
//    }
//
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
