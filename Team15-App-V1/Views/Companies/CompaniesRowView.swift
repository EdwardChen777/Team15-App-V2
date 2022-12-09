//
//  CompaniesRowView.swift
//  Team15-App-V1
//
//  Created by Edward Chen on 12/8/22.
//

import SwiftUI

struct CompaniesRowView: View {
  var companies: companyData
  
    var body: some View {
      
      NavigationLink(
        destination: CompaniesDetailView(company: companies),
        label: {
          VStack(alignment: .leading){
            Text("\(companies.name) (\(companies.ticker))")
            //        RoundedRectangle(cornerRadius: 10)
            //            .fill(CustomColor.transGreen)
            //            .frame(width: ., height: 20)
            //            .overlay(
            //              Group{
            //                VStack{
            //                  Text(companies.industry)
            //                }
            //              }
            //            ).font(.system(size: 12))
            //      }
    //        Text(companies.industry)
    //          .font(.system(size: 12))
    //        //          .foregroundColor(<#T##color: Color?##Color?#>)
    //          .padding(10)
    //          .overlay(
    //            RoundedRectangle(cornerRadius: 10, style: .continuous)
    //              .frame(maxWidth: .infinity)
    //          )
            Text(companies.industry)
                .fixedSize(horizontal: true, vertical: false)
                .multilineTextAlignment(.center)
                .padding(5)
                .font(.system(size:12))
                .frame(width: 100, height: 20)
                .background(RoundedRectangle(cornerRadius: 10).fill(CustomColor.transGreen))
          }
          
      })
      
    }
}

//struct CompaniesRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        CompaniesRowView()
//    }
//}
