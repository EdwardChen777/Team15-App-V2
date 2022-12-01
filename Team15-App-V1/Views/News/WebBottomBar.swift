//
//  WebBottomBar.swift
//  Team15-App-V1
//
//  Created by Philip Wellener on 12/1/22.
//

import SwiftUI

struct WebBottomBar: View {
  @ObservedObject var viewModel: WebViewModel
    var body: some View {
      HStack {
//        Spacer()
        Button(action: viewModel.goBack) {
          Image(systemName: "chevron.left")
        }
        Spacer()
        Button(action: viewModel.goForward) {
          Image(systemName: "chevron.right")
        }
        Spacer()
        Button(action: viewModel.share) {
          Image(systemName: "square.and.arrow.up")
        }
        Spacer()
        Button(action: viewModel.refresh) {
          Image(systemName: "arrow.clockwise")
        }
        Spacer()
        Button(action: viewModel.stop) {
          Image(systemName: "xmark")
        }
//        Spacer()
      }
    }
}
