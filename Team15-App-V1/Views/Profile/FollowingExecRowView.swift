//
//  FollowingExecRowView.swift
//  Team15-App-V1
//
//  Created by Edward Chen on 12/13/22.
//

import SwiftUI

struct FollowingExecRowView: View {
    var executive: String
    @EnvironmentObject var executives: Executives
    @EnvironmentObject var signUpController: SignUpController
    var body: some View {
      HStack{
          Text(executive)
            .padding()
        Spacer()
          if (signUpController.execFollowing.contains(executive)) {
            Button(action: {executives.unfollow(name: executive, controller: signUpController)}) {
                Text("Unfollow")
                .padding(.leading, 5)
                .padding(.trailing, 5)
                .padding(.top, 2)
                .padding(.bottom, 2)
            }
            .padding(.horizontal, 4)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                  .stroke(CustomColor.paleGreen)
            )
          } else {
            Button(action: {executives.follow(name: executive, controller: signUpController)}) {
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

//struct FollowingExecRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        FollowingExecRowView()
//    }
//}
