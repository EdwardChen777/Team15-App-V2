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
              Spacer()
            Text("\(company.name)(\(company.ticker))")
                  .foregroundColor(CustomColor.paleGreen)
              .font(.title)
              .bold()
            Spacer()
            if (signUpController.curFollowing.contains(company.name)) {
              Button(action: {companies.unfollow(name: company.name, controller: signUpController)}) {
                Text("Unfollow").bold()
                  .foregroundColor(.black)
                  .padding(.leading, 10)
                  .padding(.trailing, 10)
                  .padding(.top, 10)
                  .padding(.bottom, 10)
              }
              .padding(.horizontal, 4)
              .overlay(
                          RoundedRectangle(cornerRadius: 5)
                              .stroke(CustomColor.paleGreen)
                      )
              
            } else {
              Button(action: {companies.follow(name: company.name, controller: signUpController)}) {
                  Text("Follow").bold()
                  .foregroundColor(.black)
                  .padding(.leading, 10)
                  .padding(.trailing, 10)
                  .padding(.top, 10)
                  .padding(.bottom, 10)
              }
              .background(CustomColor.paleGreen)
              .cornerRadius(5.0)
              .padding(.trailing, 8)
            }
            Spacer()
            
          }
          
          if(company.sharesOutstanding != 0) {
            Text("Shares outstanding: \(company.sharesOutstanding)")
          }
          if(company.marketCap != 0) {
            Text("Market Capitalization: $\(company.marketCap)")
          }

//          
////          Text("\(company.sum) Analyst Ratings")
//          
          if (company.sum != 0 && company.hasRecommendation) {
            AnalystRatingsView(company: company)
          }
          
          if (company.hasReddit && company.hasTwitter) {
            SocialRatingView(company: company)
          }
          
          
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

