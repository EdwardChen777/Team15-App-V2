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
  @EnvironmentObject var executives: Executives
  
  @State var type: Int = 0
    var body: some View {
      VStack{
          HStack{
              Spacer()
              Picker("Transaction Type", selection: $type) {
                  Text("Company").tag(0)
                  Text("Executives").tag(1)
              }
              .pickerStyle(.segmented)
              Spacer()
          }
        if (type == 0) {
          List{
            ForEach(signUpController.curFollowing, id: \.self) { company in
              FollowingRowView(company: company)
                .environmentObject(signUpController)
                .environmentObject(companies)
            }
          }
        } else {
          List{
            ForEach(signUpController.execFollowing, id: \.self) { company in
              FollowingExecRowView(executive: company)
                .environmentObject(signUpController)
                .environmentObject(executives)
            }
          }
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
