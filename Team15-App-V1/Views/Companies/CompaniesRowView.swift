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
      VStack{
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Text(companies.industry)
      }
        
    }
}

//struct CompaniesRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        CompaniesRowView()
//    }
//}
