//
//  ProfileView.swift
//  Team15-App-V1
//
//  Created by Edward Chen on 11/5/22.
//

import SwiftUI

struct ProfileView: View {
//  @ObservedObject var signUpController: SignUpController
  @EnvironmentObject var signUpController: SignUpController
  @EnvironmentObject var companies: Company
  @EnvironmentObject var executives: Executives
    var body: some View {
        VStack{
            VStack{
                Text("Profile")
                    .foregroundColor(Color.white)
                    .font(.system(size: 40))
                    .bold()
                    
                    .padding(.bottom)
                    .padding(.leading)
                
            }
            .frame(maxWidth: .infinity, maxHeight: 125, alignment: .bottomLeading)
            .background(CustomColor.paleGreen)
        
            .edgesIgnoringSafeArea(.top)
        NavigationView {
            //        VStack{
            //            Text("Search")
            //                .foregroundColor(Color.white)
            //                .font(.system(size: 40))
            //            // .bold()
            //                .frame(maxWidth: .infinity, maxHeight: 150)
            //                .background(CustomColor.paleGreen)
            //
            //                .edgesIgnoringSafeArea(.top)
            //        }
            List {
                Section(header: Text("Profile Settings")) {
                    NavigationLink(
                        destination: AccountInformationView(),
                        label: {
                            Text("Account Information")
                                .fontWeight(.bold)
                                .font(.body)
                        })
                    NavigationLink(
                        destination: PrivacyView(),
                        label: {
                            Text("Privacy Terms")
                                .fontWeight(.bold)
                                .font(.body)
                        })
                    NavigationLink(
                        destination: NotificationsView(),
                        label: {
                            Text("Notifications")
                                .fontWeight(.bold)
                                .font(.body)
                        })
                }.headerProminence(.increased)
                Section(header: Text("Account Preferences")) {
                    NavigationLink(
                        destination: FollowingView(),
                        label: {
                            Text("Following")
                                .fontWeight(.bold)
                                .font(.body)
                        })
                }.headerProminence(.increased)
            }
            //.navigationBarTitle("Preferences")
        }
        .padding([.top], -50)
        .environmentObject(signUpController)
        .environmentObject(companies)
        .environmentObject(executives)
        .safeAreaInset(edge: .bottom) {
            Button(action: signUpController.logout) {
                HStack {
                    Spacer()
                    Text("Log Out")
                        .font(.headline)
                        .foregroundColor(Color.white)
                    Spacer()
                }
            }
            .padding(.vertical, 10.0)
            .background(CustomColor.paleGreen)
            .cornerRadius(10.0)
            .padding(.horizontal, 75)
            .padding(.bottom, 25)

        }
    }
  }
  
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
