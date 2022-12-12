//
//  FollowingRowView.swift
//  Team15-App-V1
//
//  Created by Edward Chen on 12/11/22.
//

import SwiftUI

struct FollowingRowView: View {
    var company: String
  @EnvironmentObject var companies: Company
  @EnvironmentObject var signUpController: SignUpController
    var body: some View {
      HStack{
          Text(company)
            .padding()
        Spacer()
          if (signUpController.curFollowing.contains(company)) {
            Button(action: {companies.unfollow(name: company, controller: signUpController)}) {
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
            Button(action: {companies.follow(name: company, controller: signUpController)}) {
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
    }
}

//struct FollowingRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        FollowingRowView()
//    }
//}
