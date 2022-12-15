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
              Spacer()
            Text("\(executive.name)")
                  .foregroundColor(CustomColor.paleGreen)
              .font(.title)
              .bold()
            Spacer()
            if (signUpController.execFollowing.contains(executive.name)) {
              Button(action: {executives.unfollow(name: executive.name, controller: signUpController)}) {
                  Text("Unfollow")
                  .padding(.leading, 10)
                  .padding(.trailing, 10)
                  .padding(.top, 10)
                  .padding(.bottom, 10)
              }
              .padding(.horizontal, 4)
              .overlay(
                  RoundedRectangle(cornerRadius: 5)
                    .stroke(CustomColor.paleGreen)
                  )
            } else {
              Button(action: {executives.follow(name: executive.name, controller: signUpController)}) {
                  Text("Follow")
                  .padding(.leading, 10)
                  .padding(.trailing, 10)
                  .padding(.top, 10)
                  .padding(.bottom, 10)
              }
              .background(CustomColor.paleGreen)
              .cornerRadius(5.0)
              .padding(.trailing, 8)
            }
              Spacer()
          }
          
          Text("Company: \(executive.ticker)")
          Text("Position: \(executive.position)")
          LabelledDivider(label: "Compensation")
            .multilineTextAlignment(.center)
            .font(.subheadline)
          
          VStack(alignment: .leading){
            HStack{
              ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.gray)
                    .frame(width: 300, height: 10)
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.green)
                    .frame(width: CGFloat((300 * executive.salary)/executive.total), height: 10)
              }
              Text("\(100 * executive.salary/executive.total)% Salary")
            }
            HStack{
              ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.gray)
                    .frame(width: 300, height: 10)
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.green)
                    .frame(width: CGFloat((300 * executive.bonus)/executive.total), height: 10)
//                        .frame(width: 100, height: 20)
              }
              Text("\(100 * executive.bonus/executive.total)% Bonus")
            }
            HStack{
              ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.gray)
                    .frame(width: 300, height: 10)
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.orange)
                    .frame(width: CGFloat((300 * executive.stockAwards)/executive.total), height: 10)
              }
              Text("\(100 * executive.stockAwards/executive.total)% Stock Awards")
            }
            HStack{
              ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.gray)
                    .frame(width: 300, height: 10)
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.green)
                    .frame(width: CGFloat((300 * executive.optionAwards)/executive.total), height: 10)
              }
              Text("\(100 * executive.optionAwards/executive.total)% Option Awards")
            }
            HStack{
              ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.gray)
                    .frame(width: 300, height: 10)
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.green)
                    .frame(width: CGFloat((300 * executive.nonEquityCompensation)/executive.total), height: 10)
              }
              Text("\(100 * executive.nonEquityCompensation/executive.total)% Non-Equity")
            }
            HStack{
              ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.gray)
                    .frame(width: 300, height: 10)
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.green)
                    .frame(width: CGFloat((300 * executive.otherCompensation)/executive.total), height: 10)
              }
              Text("\(100 * executive.otherCompensation/executive.total)% Other")
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
