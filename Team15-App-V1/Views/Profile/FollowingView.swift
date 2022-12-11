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
    var body: some View {
      ForEach(signUpController.curFollowing, id: \.self) { company in
        Text(company)
          .padding()
      }.navigationBarTitle("Following")
    }
}

//struct FollowingView_Previews: PreviewProvider {
//    static var previews: some View {
//        FollowingView()
//    }
//}
