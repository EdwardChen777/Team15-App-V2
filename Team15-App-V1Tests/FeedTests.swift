//
//  FeedTests.swift
//  Team15-App-V1Tests
//
//  Created by Edward Chen on 12/14/22.
//

import Foundation
import Firebase
@testable import Team15_App_V1

class FeedTests: XCTestCase {
  
  func testInit() {
    let articledata = [articleData(id: 1, link: "first.html", pubDate: "20221202", source: "google", title: "article1", imageUrl: "first.png", rank: false),articleData(id: 2, link: "second.html", pubDate: "20221210", source: "yahoo", title: "article2", imageUrl: "second.png", rank: true)]
    
    let transactions = [Transaction(filedAt: "20221212", issuer: "Apple Inc", symbol: "AAPL", ownerName: "Tim Cook", isDirector: false, isOfficer: true, officerTitle: "CEO", nonDerivative: [updateAmount], derivative: [updateAmount], id: 1),Transaction(filedAt: "20221213", issuer: "Tesla", symbol: "TSLA", ownerName: "Yilong Ma", isDirector: false, isOfficer: true, officerTitle: "CEO", nonDerivative: [updateAmount], derivative: [updateAmount], id: 2)]
    
    let feedData = FeedData(articles: articledata, transactions: transactions)
    
    // check nil
    XCTAssertNotNil(feedData.feed_items)
    
    // check type
    XCTAssertTrue(feedData.feed_items.count == 4)
    XCTAssertTrue(feedData.first == Feed)
    
    let article = articleData(id: 1, link: "first.html", pubDate: "20221202", source: "google", title: "article1", imageUrl: "first.png", rank: false)
    let articledata2 = [article]
    let feedData2 = FeedData(articles: articledata2, transactions: [])
    XCTAssertTrue(feedData2.feed_items.count == 1)
    XCTAssertTrue(feedData2.feed_items.first = article)
  }
  
  func testFeed(){
    let feed = Feed(id: 1, title: "hi", date: "20221204", type: "Transaction")
    XCTAssertNotNil(feed)
    XCTAssertTrue(feed.id == 1)
    XCTAssertTrue(feed.title == "hi")
    XCTAssertTrue(feed.date == "20221204")
    XCTAssertTrue(feed.type == "Transaction")
    
    XCTAssertFalse(feed.date == "20221205")
    XCTAssertFalse(feed.type == "nonTransaction")
  }

}
