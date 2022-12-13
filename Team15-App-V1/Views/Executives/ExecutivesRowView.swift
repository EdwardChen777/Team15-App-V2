//
//  ExecutivesRowView.swift
//  Team15-App-V1
//
//  Created by Edward Chen on 12/13/22.
//

import SwiftUI

struct ExecutivesRowView: View {
  var executives: executiveData
  @EnvironmentObject var signUpController: SignUpController
    var body: some View {
      NavigationLink(
        destination: ExecutivesDetailView(executive: executives),
        label: {
          VStack(alignment: .leading){
            Text("\(executives.name)")

            Text(executives.ticker)
                .fixedSize(horizontal: true, vertical: false)
                .multilineTextAlignment(.center)
                .padding(5)
                .font(.system(size:12))
                .frame(width: 100, height: 20)
                .background(RoundedRectangle(cornerRadius: 10).fill(CustomColor.transGreen))
          }
          
        }).environmentObject(signUpController)
    }
}

//struct ExecutivesRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExecutivesRowView()
//    }
//}
