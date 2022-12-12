//
//  FollowingView.swift
//  Team15-App-V1
//
//  Created by Philip Wellener on 11/6/22.
//

import SwiftUI

struct FollowingView: View {
//  @ObservedObject var signUpController: SignUpController
  @EnvironmentObject var signUpController: SignUpController
  @EnvironmentObject var companies: Company
    var body: some View {
      
      List{
        ForEach(signUpController.curFollowing, id: \.self) { company in
          FollowingRowView(company: company)
            .environmentObject(signUpController)
            .environmentObject(companies)
        }
      }.navigationBarTitle("Following")
//      ForEach(signUpController.curFollowing, id: \.self) { company in
//        ZStack{
//          RoundedRectangle(cornerRadius: 10)
//            .foregroundColor(.gray)
//            .frame(width: 400, height: 20)
//          HStack{
//            Text(company)
//              .padding()
//          }
//
//        }
//
//      }.navigationBarTitle("Following")
      
    }
}

//struct FollowingView_Previews: PreviewProvider {
//    static var previews: some View {
//        FollowingView()
//    }
//}
