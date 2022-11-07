//
//  AccountInformationView.swift
//  Team15-App-V1
//
//  Created by Philip Wellener on 11/6/22.
//

import SwiftUI
import FirebaseAuth
import Firebase
import FirebaseCore

struct AccountInformationView: View {
  let userInfo = Auth.auth().currentUser
  
    var body: some View {
      VStack {
        List {
          HStack{
            Text("Name:")
            Spacer()
//            Text(userInfo?.name ?? "John Smith").foregroundColor(.gray)
          }
          HStack{
            Text("Email:")
            Spacer()
            Text(userInfo?.email ?? "No email").foregroundColor(.gray)
          }
          HStack{
            Text("Phone Number:")
            Spacer()
//            Text(userInfo?.number ?? "999-999-9999".foregroundColor(.gray)
          }
        }
      }
    }
}

struct AccountInformationView_Previews: PreviewProvider {
    static var previews: some View {
        AccountInformationView()
    }
}
