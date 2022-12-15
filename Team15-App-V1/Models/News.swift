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
          let news_list = try JSONDecoder().decode([yahooArticle].self, from: data)
//          self.articles = news_list
          for item in news_list {
            self.articles.append(articleData(id: item.id, link: item.link, pubDate: self.editDate(date: item.pubDate), source: item.source, title: item.title, imageUrl: "none", rank: false))
          }
        }
        catch {
          print("\(error)")
        }

//      self.articles = news_list

    }
    yahoo_news.resume()
    
    
    // Documentation:
    // https://rapidapi.com/apidojo/api/seeking-alpha/
    
    let alpha_finance_url = URL(string: "https://seeking-alpha.p.rapidapi.com/news/v2/list?category=market-news%3A%3Aall&size=20&number=1")!
    var alpha_request = URLRequest(url: alpha_finance_url)
    alpha_request.allHTTPHeaderFields = [
      "X-RapidAPI-Key": "5193c1c87fmsh2d8a946b1721cbfp1e0eefjsn2e6fde45177d",
      "X-RapidAPI-Host": "seeking-alpha.p.rapidapi.com"
    ]

    let alpha_news = URLSession.shared.dataTask(with: alpha_request) { (data, response, error) in
      guard let data = data else {
        print("Error: No data to decode")
        return
      }
      print(data)
      do {
        let news_list = try JSONDecoder().decode(NewsData.self, from: data)
        var i = 0
        if let temp = news_list.data{
          for item in temp{
            if let attribute = item.attributes{
              if let publishDate = attribute.publishOn{
                if let title = attribute.title{
                  if let itemLink = item.links{
                    if let imageLink = itemLink.uriImage{
                      let defaultImage = "https://static.seekingalpha.com/assets/og_image_1200-29b2bfe1a595477db6826bd2126c63ac2091efb7ec76347a8e7f81ba17e3de6c.png"
                      var imageUrl = ""
                      if (imageLink != defaultImage){
                        imageUrl = imageLink
                      }
                      if let articleLink = itemLink.articleLink{
                        if (i == 0) {
                          self.articles.append(articleData(id: item.id, link: articleLink, pubDate: self.editDate(date: publishDate), source: "Seeking Alpha", title: title, imageUrl: imageUrl, rank: true))
                        } else {
                          self.articles.append(articleData(id: item.id, link: articleLink, pubDate: self.editDate(date: publishDate), source: "Seeking Alpha", title: title, imageUrl: imageUrl, rank: false))
                        }
                        
                      }
                      
                    }
                  }
                }
              }
              
            }
            i = i + 1
          }
          self.articles = self.sortArticle()
        }

        }
        catch {
          print("\(error)")
        }

    }
    alpha_news.resume()
    self.articles.shuffle()
    self.articles.sort{ $0.rank && !$1.rank}
  }
  
  func editDate(date: String) -> String {
    var formatted_date = date.prefix(10)
    return String(formatted_date)
  }
  
  func getArticle(id: UUID) -> articleData {
    return self.articles.first(where: { $0.id == id })!
  }
  
  func sortArticle() -> [articleData] {
    self.articles.shuffle()
    self.articles.sort{ $0.rank && !$1.rank}
    return self.articles
  }
  
}

struct yahooArticle: Decodable, Identifiable {
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

struct articleData: Decodable, Identifiable {
  var id = UUID()
  
  let link: String
  let pubDate: String
  let source: String
  let title: String
  let imageUrl: String
  let rank: Bool

  enum CodingKeys : String, CodingKey {
    case link
    case pubDate
    case source
    case title
    case imageUrl
    case rank
  }
}



struct Attributes: Decodable {
  let publishOn: String?
  let gettyImageUrl: String?
  let title: String?

  enum CodingKeys : String, CodingKey {
    case publishOn = "publishOn"
    case gettyImageUrl = "gettyImageUrl"
    case title = "title"
  }
}

struct Links: Decodable {
  let uriImage: String?
  let articleLink: String?

  enum CodingKeys : String, CodingKey {
    case uriImage = "uriImage"
    case articleLink = "canonical"
  }
}

struct SubData: Decodable, Identifiable {
  var id = UUID()
  let type: String
  let attributes: Attributes?
  let links: Links?

  enum CodingKeys : String, CodingKey {
    case links = "links"
    case attributes = "attributes"
    case type = "type"
  }
}

struct NewsData: Decodable {
  let data: [SubData]?

  enum CodingKeys : String, CodingKey {
    case data = "data"
  }
}
