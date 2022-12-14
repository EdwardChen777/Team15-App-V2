//
//  NewsTest.swift
//  Team15-App-V1Tests
//
//  Created by Edward Chen on 12/14/22.
//

import Foundation
import XCTest
@testable import Team15_App_V1

class NewsTests: XCTestCase {
  
  func testInit() {
    let news : [articleData] = [articleData(id: 1, link: "test", pubDate: "pubDate", source: "source", title: "title", imageUrl: "imageUrl", rank: false),articleData(id: 2, link: "test2", pubDate: "pubDate2", source: "source2", title: "title2", imageUrl: "imageUrl2", rank: false),articleData(id: 3, link: "test3", pubDate: "pubDate3", source: "source3", title: "title3", imageUrl: "imageUrl3", rank: true)]
    
    XCTAssertNotNil(news)
    XCTAssertTrue(news.count == 3)
    XCTAssertFalse(news.count == 2)
    XCTAssertTrue(news.first.link == "test")
    XCTAssertTrue(news.first.pubDate == "pubDate")
    XCTAssertTrue(news.first.source == "source")
    XCTAssertTrue(news.first.rank == false)
    XCTAssertTrue(news.last.pubDate == "pubDate3")
    XCTAssertTrue(news.last.rank == true)
  }
}

