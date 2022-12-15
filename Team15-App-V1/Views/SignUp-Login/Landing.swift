//
//  Landing.swift
//  Team15-App-V1
//
//  Created by Edward Chen on 11/5/22.
//

import SwiftUI

struct Landing: View {
  var body: some View {
    NavigationView {
        ZStack {
            VStack{
                                    /*
                     VStack{
                     Rectangle()
                     .fill(CustomColor.paleGreen)
                     .frame(height: 250)
                     .overlay(Text("Welcome").font(.largeTitle)).foregroundColor(Color.white)
                     }
                     .background(Color.green)
                     .clipShape(RoundedRectangle(cornerRadius: 20))
                     .ignoresSafeArea()
                     VStack{
                     LabelledDivider(label: "Today's Trends")
                     }
                     HStack{
                     RoundedRectangle(cornerRadius: 10)
                     .fill(CustomColor.paleGreen)
                     .frame(width: 110, height: 110)
                     .overlay(Text("Transactions")).font(.system(size: 12))
                     Spacer()
                     RoundedRectangle(cornerRadius: 10)
                     .fill(CustomColor.paleGreen)
                     .frame(width: 110, height: 110)
                     .overlay(Text("Trade Volume")).font(.system(size: 12))
                     Spacer()
                     RoundedRectangle(cornerRadius: 10)
                     .fill(CustomColor.paleGreen)
                     .frame(width: 110, height: 110)
                     .overlay(Text("Hottest Stock")).font(.system(size: 12))
                     
                     }
                     VStack{
                     LabelledDivider(label: "Your Feed")
                     }
                     */
                    
                    VStack{
                        Text("iNSDR")
                            .font(.system(size: 90
                                         )
                            .weight(.heavy))
                            .foregroundColor(CustomColor.paleGreen)
                        Text("Insider transactions on the other side")
                            .font(.system(size: 20))
                    }
                    .padding(.bottom, 150)
                NavigationLink(destination: SignUp()) {
                        HStack {
                            Spacer()
                            Text("Sign Up")
                                .font(.headline)
                                .foregroundColor(Color.white)
                            Spacer()
                        }
                        .padding(.vertical, 10.0)
                        .background(CustomColor.paleGreen)
                        .cornerRadius(10.0)
                        .padding(.horizontal, 50)
                        /*
                         Text("Sign Up")
                         .foregroundColor(Color.white)
                         .padding(10.0)
                         .background(Color.green.cornerRadius(10.0))
                         */
                        //.scaleEffect(isPressed ? 0.95 : 1)
                    }
                    
                    NavigationLink(destination: LogIn()) {
                        HStack {
                            Spacer()
                            Text("Log In")
                                .font(.headline)
                                .foregroundColor(Color.white)
                            Spacer()
                        }
                        .padding(.vertical, 10.0)
                        .background(CustomColor.paleGreen)
                        .cornerRadius(10.0)
                        .padding(.horizontal, 50)
                    }
                    .padding(.top,15)
                    Spacer()
                }
                .padding()
                .offset(y: 300)
                Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(gradient: Gradient(colors: [CustomColor.paleGreen, Color.white]),
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing)
                    //.edgesIgnoringSafeArea(.all)
                    .ignoresSafeArea()
                    //.overlay())
                    )
    }
  }
}

struct LabelledDivider: View {

    let label: String
    let horizontalPadding: CGFloat
    let color: Color

    init(label: String, horizontalPadding: CGFloat = 15, color: Color = .gray) {
        self.label = label
        self.horizontalPadding = horizontalPadding
        self.color = color
    }

    var body: some View {
        HStack {
            line
            Text(label).foregroundColor(color).font(.system(size: 12))
            line
        }
    }

    var line: some View {
        VStack { Divider().background(color) }.padding(horizontalPadding)
    }
}

struct Landing_Previews: PreviewProvider {
    static var previews: some View {
        Landing()
    }
}
