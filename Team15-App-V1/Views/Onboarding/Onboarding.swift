//
//  Onboarding.swift
//  Team15-App-V1
//
//  Created by Edward Chen on 11/15/22.
//

import SwiftUI

struct Onboarding: View {
  @EnvironmentObject var signUpController: SignUpController
    var body: some View {
      TabView {
        OnboardingTab(systemImageName: "person.crop.circle.badge.plus",
                    title: "Follow",
                    description: "Follow executives and companies to receive the most up to date information regarding your interests.",
                    isEnd: false)
        .environmentObject(signUpController)
        OnboardingTab(systemImageName: "eye.circle",
                    title: "Observe",
                    description: "Observe the recent news and transactions to make the most informed investment decisions.",
                    isEnd: false)
        .environmentObject(signUpController)
        OnboardingTab(systemImageName: "chart.line.uptrend.xyaxis.circle",
                    title: "Track",
                    description: "Track the insiders to see how the people with valuable information are investing.",
                    isEnd: true)
        .environmentObject(signUpController)
      }
      .tabViewStyle(.page(indexDisplayMode: .always))
      .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

//struct Onboarding_Previews: PreviewProvider {
//    static var previews: some View {
//        Onboarding()
//    }
//}
