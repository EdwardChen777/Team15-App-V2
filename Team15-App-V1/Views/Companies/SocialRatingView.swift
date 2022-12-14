//
//  SocialRatingView.swift
//  Team15-App-V1
//
//  Created by Philip Wellener on 12/14/22.
//

import SwiftUI


struct SocialRatingView: View {
  var company: companyData
  
  var body: some View {
      LabelledDivider(label: "Social Sentiment")
        .multilineTextAlignment(.center)
        .font(.subheadline)
      
      HStack{
        VStack{
          Text("Reddit")
            .multilineTextAlignment(.center)
            .padding(.bottom, 5)
            .bold()

          VStack {
            HStack{
              Text("Mention").foregroundColor(.gray)
              Spacer()
              Text("\(company.redditMention)")
            }
            Divider()
          }
          VStack {
            HStack{
              Text("Pos. Mention").foregroundColor(.gray)
              Spacer()
              Text("\(company.redditPosMention)")
            }
            Divider()
          }
          VStack {
            HStack{
              Text("Neg. Mention").foregroundColor(.gray)
              Spacer()
              Text("\(company.redditNegMention)")
            }
            Divider()
          }
          VStack {
            HStack{
              Text("Pos. Score").foregroundColor(.gray)
              Spacer()
              Text("\(company.redditPosScore)")
            }
            Divider()
          }
          VStack {
            HStack{
              Text("Neg. Score").foregroundColor(.gray)
              Spacer()
              Text("\(company.redditNegScore)")
            }
            
            Divider()
          }
          VStack {
            HStack{
              Text("Score").foregroundColor(.gray)
              Spacer()
              Text("\(company.redditScore)")
            }
            Divider()
          }

        }.padding(.trailing, 5)

        VStack {
          Text("Twitter")
            .multilineTextAlignment(.center)
            .padding(.bottom, 5)
            .bold()
          VStack {
            HStack{
              Text("Mention").foregroundColor(.gray)
              Spacer()
              Text("\(company.twitterMention)")
            }
            Divider()
          }
          VStack {
            HStack{
              Text("Pos. Mention").foregroundColor(.gray)
              Spacer()
              Text("\(company.twitterPosMention)")
            }
            Divider()
          }
          VStack {
            HStack{
              Text("Neg. Mention").foregroundColor(.gray)
              Spacer()
              Text("\(company.twitterNegMention)")
            }
            Divider()
          }
          VStack {
            HStack{
              Text("Pos. Score").foregroundColor(.gray)
              Spacer()
              Text("\(company.twitterPosScore)")
            }
            Divider()
          }
          VStack {
            HStack{
              Text("Neg. Score").foregroundColor(.gray)
              Spacer()
              Text("\(company.twitterNegScore)")
            }
            Divider()
          }
          VStack {
            HStack{
              Text("Score").foregroundColor(.gray)
              Spacer()
              Text("\(company.twitterScore)")
            }
            Divider()
          }
        }.padding(.leading, 5)
    }
  }
  
}
