//
//  DigitsPicker01.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2025/06/28.
//

import SwiftUI

struct Digits01Picker {
  let settings: Settings
  @ObservedObject private var viewModel: Digits01PickerViewModel
  
  init(settings: Settings) {
    self.settings = settings
    self.viewModel = .init(state100: settings.state100)
  }
}

extension Digits01Picker: View {
  var body: some View {
    NavigationStack {
      List {
        ForEach(Digits01.allCases) { digit in
          Digits01Button(viewModel: digit.buttonViewModel) {
            viewModel.input.digitButtonTapped.send(digit)
          }
        }
      }
        .toolbar {
          ToolbarItem(placement: .confirmationAction) {
            BadgeView(number: viewModel.selectedNum)
          }
          ToolbarItem(placement: .principal) {
            Text("1の位の数で選ぶ")
          }
        }
    }
  }
}

#Preview {
  Digits01Picker(settings: Settings())
}
