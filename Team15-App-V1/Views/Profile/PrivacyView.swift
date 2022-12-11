//
//  PrivacyView.swift
//  Team15-App-V1
//
//  Created by Philip Wellener on 11/6/22.
//

import SwiftUI

struct PrivacyView: View {
    var body: some View {
      Text("Privacy Statement").font(.title)
      Section {
        Text("At Insdr, we take privacy and security seriously. This Privacy Policy outlines how Insdr and its affiliates (collectively, “Insdr,” “we,” “our,” or “us”) process the information we collect about you through our websites, mobile apps, and other online services (collectively, the “Services”) and when you otherwise interact with us, such as through our customer service channels.")
      }
      Spacer()
    }
}

struct PrivacyView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyView()
    }
}
