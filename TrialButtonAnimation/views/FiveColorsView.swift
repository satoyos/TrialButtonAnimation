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
    List {
      ForEach(FiveColors.all) { color in
        FiveColorButton(ofColor: color, fillType: viewModel.fillType(of: color))
      }
    }
  }
  
}

#Preview {
  FiveColorsView(settings: Settings())
    .environmentObject(ScreenSizeStore())
}
