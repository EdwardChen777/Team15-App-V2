//
//  OnboardingTab.swift
//  Team15-App-V1
//
//  Created by Edward Chen on 11/15/22.
//

import SwiftUI

struct OnboardingTab: View {
  @EnvironmentObject var signUpController: SignUpController
  let systemImageName: String
  let title: String
  let description: String
  let isEnd: Bool
    var body: some View {
      VStack(spacing: 20){
        Image(systemName: systemImageName)
          .resizable()
          .scaledToFit()
          .frame(width: 100, height: 100)
          .foregroundColor(.teal)
        Text(title)
          .font(.title).bold()
        Text(description)
          .multilineTextAlignment(.center)
          .foregroundColor(.secondary)
        if isEnd {
          Button(action: {signUpController.completeOnboarding()}) {
            Text("Go to App")
              .padding(10.0)
              .overlay(RoundedRectangle(cornerRadius: 10.0)
              .stroke(lineWidth: 2.0))
          }
        }
        
      }
      .padding(.horizontal,40)
    }
}

//struct OnboardingTab_Previews: PreviewProvider {
//    static var previews: some View {
//        OnboardingTab()
//    }
//}
