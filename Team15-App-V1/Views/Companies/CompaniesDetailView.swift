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
    var body: some View {
      ScrollView {
        VStack(alignment: .leading){
          HStack{
            Text("\(company.name)(\(company.ticker))")
              .foregroundColor(Color(hue: 0.44, saturation: 0.706, brightness: 0.893))
              .font(.title)
            Spacer()
            Button(action: companies.follow) {
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
          
          Text("Shares outstanding: \(company.sharesOutstanding)")
          Text("Market Capitalization: $\(company.marketCap)")
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
