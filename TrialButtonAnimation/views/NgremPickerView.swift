//
//  NgremPickerView.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2025/05/17.
//

import SwiftUI

struct NgremPickerView {
  let settings: Settings
  @ObservedObject private var viewModel: NgramPickerViewModel
  @EnvironmentObject var screenSizeStore: ScreenSizeStore
  
  init(settings: Settings) {
    self.settings = settings
    self.viewModel = .init(state100: settings.state100)
  }
}

extension NgremPickerView: View {
  var body: some View {
    NavigationStack {
      List {
        ForEach(NgramSections.default) { section in
          Section(header: Text(section.title)) {
            ForEach(section.firstChars) { char in
              NgramButton(viewModel: char.buttonViewModel) {
                print("「\(char)」が押されたよ！")
                viewModel.input.chrButotnTapped.send(char)
              }
            }
          }
        }
      }
      .safeAreaInset(edge: .top) {
        HStack {
          Spacer()
          BadgeView(number: viewModel.selectedNum)
            .padding()
        }
        .frame(height: 30)
      }
    }
  }
}

#Preview {
  NgremPickerView(settings: Settings())
    .environmentObject(ScreenSizeStore())
}
