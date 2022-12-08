//
//  News.swift
//  Team15-App-V1
//
//  Created by Philip Wellener on 11/30/22.
//

import Foundation

class News: ObservableObject {
  @Published var articles: [articleData] = []
  
  
  init () {
    
    // Documentation:
    // https://rapidapi.com/sparior/api/yahoo-finance15/
    let yahoo_finance_url = URL(string: "https://yahoo-finance15.p.rapidapi.com/api/yahoo/ne/news")!
    var yahoo_request = URLRequest(url: yahoo_finance_url)
    yahoo_request.allHTTPHeaderFields = [
      "X-RapidAPI-Key": "5193c1c87fmsh2d8a946b1721cbfp1e0eefjsn2e6fde45177d",
      "X-RapidAPI-Host": "yahoo-finance15.p.rapidapi.com"
    ]
    
    let yahoo_news = URLSession.shared.dataTask(with: yahoo_request) { (data, response, error) in
      guard let data = data else {
        print("Error: No data to decode")
        return
      }

//      // Decode the JSON here
//      guard let news_list = try? JSONDecoder().decode([articleData].self, from: data) else {
//            print("Error: Couldn't decode data into a result")
//            return
//        }
      
      do {
          let news_list = try JSONDecoder().decode([articleData].self, from: data)
//          self.articles = news_list
          for item in news_list {
            self.articles.append(articleData(id: item.id, link: item.link, pubDate: self.editDate(date: item.pubDate), source: item.source, title: item.title))
          }
        }
        catch {
          print("\(error)")
        }

//      self.articles = news_list

    }
    yahoo_news.resume()
    
  }
  
  func editDate(date: String) -> String {
    var formatted_date = date.prefix(10)
    return String(formatted_date)
  }
  
  
}

struct articleData: Decodable, Identifiable {
  var id = UUID()
  
  let link: String
  let pubDate: String
  let source: String
  let title: String

  enum CodingKeys : String, CodingKey {
    case link
    case pubDate
    case source
    case title
  }
}

