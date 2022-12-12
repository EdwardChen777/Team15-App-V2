//
//  CompaniesDetailView.swift
//  Team15-App-V1
//
//  Created by Edward Chen on 12/8/22.
//

import SwiftUI
import Charts

struct CompaniesDetailView: View {
  var company: companyData
  @EnvironmentObject var companies: Company
  @EnvironmentObject var signUpController: SignUpController
    var body: some View {
      ScrollView {
        VStack(alignment: .leading){
          HStack{
            Text("\(company.name)(\(company.ticker))")
              .foregroundColor(Color(hue: 0.44, saturation: 0.706, brightness: 0.893))
              .font(.title)
            Spacer()
            if (signUpController.curFollowing.contains(company.name)) {
              Button(action: {companies.unfollow(name: company.name, controller: signUpController)}) {
                  Text("Unfollow")
                  .padding(.leading, 5)
                  .padding(.trailing, 5)
                  .padding(.top, 2)
                  .padding(.bottom, 2)
              }
              .background(CustomColor.paleGreen)
              .cornerRadius(5.0)
              .padding(.trailing, 8)
            } else {
              Button(action: {companies.follow(name: company.name, controller: signUpController)}) {
                  Text("Follow")
                  .padding(.leading, 5)
                  .padding(.trailing, 5)
                  .padding(.top, 2)
                  .padding(.bottom, 2)
              }
              .background(CustomColor.paleGreen)
              .cornerRadius(5.0)
              .padding(.trailing, 8)
            }
            
            
          }
          
          Text("Shares outstanding: \(company.sharesOutstanding)")
          Text("Market Capitalization: $\(company.marketCap)")
          
//          Text("\(company.sum) Analyst Ratings")
          
          if (company.sum != 0 && company.hasRecommendation) {
            LabelledDivider(label: "\(company.sum) Analyst Ratings")
              .multilineTextAlignment(.center)
              .font(.subheadline)
            HStack{
              ZStack{
                Circle()
                    .stroke(Color.gray, lineWidth: 15)
                    .frame(width: 120, height: 120)
                Circle()
                  .trim(from: 0.0, to: CGFloat(Double(company.strongBuy)/Double(company.sum)))
                    .stroke(Color.green, lineWidth: 15)
                    .frame(width: 120, height: 120)
                    .rotationEffect(Angle(degrees: -90))
                VStack{
                  Text("\(Double(company.strongBuy)/Double(company.sum))")
                          .font(.custom("HelveticaNeue", size: 15.0))
                  Text("Strong Buy")
                }
                
              }
              
              VStack(alignment: .leading){
                HStack{
                  ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.gray)
                        .frame(width: 150, height: 10)
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.green)
                        .frame(width: CGFloat((150 * company.strongBuy)/company.sum), height: 10)
                  }
                  Text("\(100 * company.strongBuy/company.sum)% SB")
                }
                HStack{
                  ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.gray)
                        .frame(width: 150, height: 10)
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.green)
                        .frame(width: CGFloat((150 * company.buy)/company.sum), height: 10)
//                        .frame(width: 100, height: 20)
                  }
                  Text("\(100 * company.buy/company.sum)% Buy")
                }
                HStack{
                  ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.gray)
                        .frame(width: 150, height: 10)
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.orange)
                        .frame(width: CGFloat((150 * company.hold)/company.sum), height: 10)
                  }
                  Text("\(100 * company.hold/company.sum)% Hold")
                }
                HStack{
                  ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.gray)
                        .frame(width: 150, height: 10)
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.red)
                        .frame(width: CGFloat((150 * company.sell)/company.sum), height: 10)
                  }
                  Text("\(100 * company.sell/company.sum)% Sell")
                }
                HStack{
                  ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.gray)
                        .frame(width: 150, height: 10)
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.red)
                        .frame(width: CGFloat((150 * company.strongSell)/company.sum), height: 10)
                  }
                  Text("\(100 * company.strongSell/company.sum)% SS")
                }
              }
            }
          }
          
          if (company.hasReddit && company.hasTwitter) {
            LabelledDivider(label: "Social Sentiment")
              .multilineTextAlignment(.center)
              .font(.subheadline)
            
            HStack{
              VStack(alignment: .leading){
                Text("Reddit")
                Group{
                  HStack{
                    Text("Mention")
                    Text("\(company.redditMention)")
                  }
                  HStack{
                    Text("Pos Mention")
                    Text("\(company.redditPosMention)")
                  }
                  HStack{
                    Text("Neg Mention")
                    Text("\(company.redditNegMention)")
                  }
                  HStack{
                    Text("Pos Score")
                    Text("\(company.redditPosScore)")
                  }
                  HStack{
                    Text("Neg Score")
                    Text("\(company.redditNegScore)")
                  }
                  HStack{
                    Text("Score")
                    Text("\(company.redditScore)")
                  }
                }

              }

              VStack(alignment: .leading){
                Text("Twitter")
                Group{
                  HStack{
                    Text("Mention")
                    Text("\(company.twitterMention)")
                  }
                  HStack{
                    Text("Pos Mention")
                    Text("\(company.twitterPosMention)")
                  }
                  HStack{
                    Text("Neg Mention")
                    Text("\(company.twitterNegMention)")
                  }
                  HStack{
                    Text("Pos Score")
                    Text("\(company.twitterPosScore)")
                  }
                  HStack{
                    Text("Neg Score")
                    Text("\(company.twitterNegScore)")
                  }
                  HStack{
                    Text("Score")
                    Text("\(company.twitterScore)")
                  }
                }
              }
            }
          }
          
          
          
//          Text("Market Capitalization: $\(company.buy)")
//          Text("Market Capitalization: $\(company.sell)")
//          Text("Market Capitalization: $\(company.redditMention)")
          
          // stacked bar charts need to consolidate data from object
//          GroupBox ("Recommendations") {
//            Chart(type) { element in
//              if element.pricePerShare > 0 {
//                BarMark (
//                  x: .value("Name",element.pricePerShare),
//                  y: .value("Total Value",element.shares)
//                )
//                .foregroundStyle(by: .value("Action",element.action))
//                .position(by: .value("Action",element.action))
//              }
//
//            }
//            .chartYAxis {
//              AxisMarks(position: .leading)
//            }
//            .chartXAxisLabel("Price Per Share")
//            .chartYAxisLabel("Shares Involved")
//            .chartForegroundStyleScale([
//              "A": Color.green,
//              "D": Color.red
//            ])
//            .frame(height: 250)
//          }
          
        }
      }
      .padding(10)
    }
}

//struct CompaniesDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        CompaniesDetailView()
//    }
//}
