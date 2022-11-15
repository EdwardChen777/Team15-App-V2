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
        OnboardingTab(systemImageName: "scribble.variable",
                    title: "Follow",
                    description: "Follow politicians, executives, and companies to receive the most up to date information regarding your interests.",
                    isEnd: false)
        .environmentObject(signUpController)
        OnboardingTab(systemImageName: "paintpalette.fill",
                    title: "Observe",
                    description: "Observe the recent news and transactions to you make your most informed investment decisions.",
                    isEnd: false)
        .environmentObject(signUpController)
        OnboardingTab(systemImageName: "dial.min.full",
                    title: "Track",
                    description: "Track the insiders to see how the people with valuable information are acting.",
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
