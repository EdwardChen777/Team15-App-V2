//
//  AnalystRatingsView.swift
//  Team15-App-V1
//
//  Created by Philip Wellener on 12/14/22.
//

import SwiftUI
import Charts

struct AnalystRatingsView: View {
  var company: companyData
  
  var body: some View {
    if(company.sharesOutstanding != 0) {
      Text("Shares outstanding: \(company.sharesOutstanding)")
    }
    if(company.marketCap != 0) {
      Text("Market Capitalization: $\(company.marketCap)")
    }
//          Text("Shares outstanding: \(company.sharesOutstanding)")
//          Text("Market Capitalization: $\(company.marketCap)")
    
//          Text("\(company.sum) Analyst Ratings")
    
      LabelledDivider(label: "\(company.sum) Analyst Ratings")
        .multilineTextAlignment(.center)
        .font(.subheadline)
      HStack{
        ZStack(alignment: .center){
          let graphDetails = getMaxOption(company: company)
          Circle()
              .stroke(Color.gray, lineWidth: 15)
              .frame(width: 120, height: 120)
          Circle()
//                  .trim(from: 0.0, to: CGFloat(Double(company.strongBuy)/Double(company.sum)))
            .trim(from: 0.0, to: CGFloat(Double(graphDetails[2])!/Double(company.sum)))
//                    .stroke(Color.green, lineWidth: 15)
              .stroke(Color(colorName: graphDetails[1])!, lineWidth: 15)
              .frame(width: 120, height: 120)
              .rotationEffect(Angle(degrees: -90))
          VStack{
            Text("\(100 * Int(Double(graphDetails[2])!)/company.sum)%")
//                          .font(.custom("HelveticaNeue", size: 15.0))
//                  Text("Strong Buy")
            Text(graphDetails[0])
          }
          
        }
//              Spacer()
        
        VStack(alignment: .leading){
          let barWidth = UIScreen.main.bounds.width/4
          HStack{
            ZStack(alignment: .leading) {
              RoundedRectangle(cornerRadius: 10)
                  .foregroundColor(.gray)
                  .frame(width: barWidth, height: 10)
              RoundedRectangle(cornerRadius: 10)
                  .foregroundColor(.green)
                  .frame(width: CGFloat((Int(barWidth) * company.strongBuy)/company.sum), height: 10)
            }
            Text("\(100 * company.strongBuy/company.sum)% SB")
          }
          HStack{
            ZStack(alignment: .leading) {
              RoundedRectangle(cornerRadius: 10)
                  .foregroundColor(.gray)
                  .frame(width: barWidth, height: 10)
              RoundedRectangle(cornerRadius: 10)
                  .foregroundColor(.green)
                  .frame(width: CGFloat((Int(barWidth) * company.buy)/company.sum), height: 10)
//                        .frame(width: 100, height: 20)
            }
            Text("\(100 * company.buy/company.sum)% Buy")
          }
          HStack{
            ZStack(alignment: .leading) {
              RoundedRectangle(cornerRadius: 10)
                  .foregroundColor(.gray)
                  .frame(width: barWidth, height: 10)
              RoundedRectangle(cornerRadius: 10)
                  .foregroundColor(.orange)
                  .frame(width: CGFloat((Int(barWidth) * company.hold)/company.sum), height: 10)
            }
            Text("\(100 * company.hold/company.sum)% Hold")
          }
          HStack{
            ZStack(alignment: .leading) {
              RoundedRectangle(cornerRadius: 10)
                  .foregroundColor(.gray)
                  .frame(width: barWidth, height: 10)
              RoundedRectangle(cornerRadius: 10)
                  .foregroundColor(.red)
                  .frame(width: CGFloat((Int(barWidth) * company.sell)/company.sum), height: 10)
            }
            Text("\(100 * company.sell/company.sum)% Sell")
          }
          HStack{
            ZStack(alignment: .leading) {
              RoundedRectangle(cornerRadius: 10)
                  .foregroundColor(.gray)
                  .frame(width: barWidth, height: 10)
              RoundedRectangle(cornerRadius: 10)
                  .foregroundColor(.red)
                  .frame(width: CGFloat((Int(barWidth) * company.strongSell)/company.sum), height: 10)
            }
            Text("\(100 * company.strongSell/company.sum)% SS")
          }
        }.padding(.leading, 20)
      }.frame(maxWidth: UIScreen.main.bounds.width)
        
  }
}

extension Color {
    
    init?(colorName: String) {
        switch colorName {
        case "red":         self = .red
        case "orange":      self = .orange
        case "green":       self = .green
        default:            return nil
        }
    }
}

