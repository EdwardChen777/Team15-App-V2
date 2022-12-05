//
//  UpdatesDetailView.swift
//  Team15-App-V1
//
//  Created by Edward Chen on 11/8/22.
//

import Charts
import SwiftUI

struct UpdatesDetailView: View {
  
  var transactions: Transaction
  
  // might need to initialize to transactions.nonDerivative
  @State var type: [updateAmount] = []
  
//  init(_ transaction: [updateAmount]) {
//    _type = State<[updateAmount]>(initialValue: transaction)
//  }
  
    var body: some View {
      
      let temp1 = transactions.nonDerivative.map{Int($0.pricePerShare) * Int($0.shares)}.reduce(0,+) + transactions.derivative.map{Int($0.pricePerShare) * Int($0.shares)}.reduce(0,+)
//      let temp = transactions.derivative.map{Int($0.pricePerShare) * Int($0.shares)}
      ScrollView{
        VStack(alignment: .leading){
          
          Text(transactions.symbol)
            .foregroundColor(Color(hue: 0.44, saturation: 0.706, brightness: 0.893))
            .font(.title)
//            .multilineTextAlignment(.leading)
          
          Text("Last updated: \(transactions.filedAt)")
            .foregroundColor(Color.black)
          // line
          HStack{
              RoundedRectangle(cornerRadius: 10)
                  .fill(CustomColor.transGreen)
                  .frame(width: 110, height: 110)
                  .overlay(
                    Group{
                      VStack{
                        Text("Transactions")
                        let total = transactions.nonDerivative.count + transactions.derivative.count
                        Text("\(total)")
                      }
                    }
                  ).font(.system(size: 12))
              Spacer()
              RoundedRectangle(cornerRadius: 10)
                  .fill(CustomColor.transGreen)
                  .frame(width: 110, height: 110)
                  .overlay(
                    Group{
                      VStack{
                        Text("Trade Volume")
                        Text("$\(temp1)")
                      }
                    }
                  ).font(.system(size: 12))
              Spacer()
              RoundedRectangle(cornerRadius: 10)
                  .fill(CustomColor.transGreen)
                  .frame(width: 110, height: 110)
                  .overlay(Text("Hottest Stock")).font(.system(size: 12))
          }
          
          Text("Transaction owner: \(transactions.ownerName)")
            .foregroundColor(Color(hue: 0.44, saturation: 0.706, brightness: 0.893))
        }

        Picker("Transaction Type", selection: $type) {
          Text("Non-Derivative").tag(transactions.nonDerivative)
          Text("Derivative").tag(transactions.derivative)
        }
        .pickerStyle(.segmented)
        GroupBox ("Non Derivative Transactions") {
          Chart(type) { element in
            if element.pricePerShare > 0 {
              BarMark (
                x: .value("Name",element.pricePerShare),
                y: .value("Total Value",element.shares)
              )
              .foregroundStyle(by: .value("Action",element.action))
              .position(by: .value("Action",element.action))
            }
              
          }
          .chartYAxis {
            AxisMarks(position: .leading)
          }
          .chartXAxisLabel("Price Per Share")
          .chartYAxisLabel("Shares Involved")
          .chartForegroundStyleScale([
            "A": Color.green,
            "D": Color.red
          ])
          .frame(height: 250)
        }
        
//        GroupBox ("Derivative Transactions") {
//          Chart(transactions.derivative) { element in
//            if element.pricePerShare > 0 {
//              BarMark (
//                x: .value("Name",element.pricePerShare),
//                y: .value("Total Value",element.shares)
//              )
//              .foregroundStyle(by: .value("Action",element.action))
//              .position(by: .value("Action",element.action))
//            }
//
//          }.chartForegroundStyleScale([
//            "A": Color.green,
//            "D": Color.red
//          ])
//          .frame(height: 250)
//        }
        
        
        Spacer()
        Spacer()
      }
      .padding()
      
      
      
      
    }
}

//struct UpdatesDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        UpdatesDetailView()
//    }
//}
