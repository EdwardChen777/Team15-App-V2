//
//  ExecutivesDetailView.swift
//  Team15-App-V1
//
//  Created by Edward Chen on 12/13/22.
//

import SwiftUI

struct ExecutivesDetailView: View {
  var executive: executiveData
  @EnvironmentObject var executives: Executives
  @EnvironmentObject var signUpController: SignUpController
    var body: some View {
      ScrollView{
        VStack(alignment: .leading){
          HStack{
            Text("\(executive.name)(\(executive.ticker))")
              .foregroundColor(Color(hue: 0.44, saturation: 0.706, brightness: 0.893))
              .font(.title)
            Spacer()
            if (signUpController.execFollowing.contains(executive.name)) {
              Button(action: {executives.unfollow(name: executive.name, controller: signUpController)}) {
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
              Button(action: {executives.follow(name: executive.name, controller: signUpController)}) {
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
    }
}

//struct ExecutivesDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExecutivesDetailView()
//    }
//}
