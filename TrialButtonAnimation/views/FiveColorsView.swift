//
//  FiveColorsView.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2025/04/01.
//

import SwiftUI

struct FiveColorsView {
  let settings: Settings
  @ObservedObject private var viewModel: FiveColorsViewModel
  @EnvironmentObject var screenSizeStore: ScreenSizeStore
  
  init(settings: Settings) {
    self.settings = settings
    self.viewModel = .init(state100: settings.state100)
  }
}

extension FiveColorsView: View {
  var body: some View {
    NavigationView {
      List {
        ForEach(FiveColors.all) { color in
          FiveColorButton(ofColor: color, fillType: viewModel.fillType(of: color))
        }
      }
      .toolbar {
        ToolbarItem(placement: .confirmationAction) {
          BadgeView(number: viewModel.output.state100.selectedNum)
        }
        ToolbarItem(placement: .principal) {
          Text("五色百人一首")
        }
      }
    }
  }
  
}

#Preview {
  FiveColorsView(settings: Settings())
    .environmentObject(ScreenSizeStore())
}
