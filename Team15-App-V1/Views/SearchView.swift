//
//  SearchView.swift
//  Team15-App-V1
//
//  Created by Edward Chen on 11/5/22.
//

import SwiftUI

struct SearchView: View {
  @State var searchField: String = ""
  @State var displayedTransactions = [Transaction]()
  @State var displayedCompanies = [companyData]()
  @EnvironmentObject var updates: Updates
  @EnvironmentObject var companies: Company
  @EnvironmentObject var signUpController: SignUpController
    var body: some View {
        let binding = Binding<String>(get: {
            self.searchField
        }, set: {
            self.searchField = $0
            self.updates.search(searchText: self.searchField)
            self.companies.search(searchText: self.searchField)
            self.displayTransactions()
            self.displayCompanies()
        })
        //        VStack {
        //            Text("Search")
        //                .foregroundColor(Color.white)
        //                .font(.system(size: 40))
        //            // .bold()
        //                .frame(maxWidth: .infinity, maxHeight: 100)
        //                .background(CustomColor.paleGreen)
        //
        //                .edgesIgnoringSafeArea(.top)
        //        }
        VStack{
            VStack{
                Text("Search")
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
                VStack {
                    //            VStack {
                    //                Text("Search")
                    //                    .foregroundColor(Color.white)
                    //                    .font(.system(size: 40))
                    //                // .bold()
                    //                    .frame(maxWidth: .infinity, maxHeight: 100)
                    //                    .background(CustomColor.paleGreen)
                    //
                    //                    .edgesIgnoringSafeArea(.top)
                    //            }
                    //            .padding()
                    List{
                        ForEach(displayedTransactions) {
                            update in UpdatesRowView(transactions: update)
                        }
                        ForEach(displayedCompanies) {
                            update in CompaniesRowView(companies: update)
                        }
                    }
                    
                    //.navigationBarTitle("Search")
                    .searchable(text: binding, prompt: "Search for News and Updates")
                    .disableAutocorrection(true)
                }
                //        }.onAppear(perform: loadData)
                // replace the generic text above with a VStack as instructed
            }.environmentObject(signUpController)
                .padding([.top], -50)
            Spacer()
        }
    }
  
  func displayTransactions() {
    if searchField != "" {
      displayedTransactions = updates.filteredTransactions
    } else {
      displayedTransactions = []
    }
  }
  func displayCompanies() {
    if searchField != "" {
      displayedCompanies = companies.filteredCompanies
    } else {
      displayedCompanies = []
    }
  }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
