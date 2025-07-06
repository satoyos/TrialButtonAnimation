//
//  Digits01Button.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2025/06/22.
//

import SwiftUI

struct Digits01Button {
  @ObservedObject var viewModel: Digits01ButtonViewModel
  
  let action: () -> Void
  @EnvironmentObject var screensizeStore: ScreenSizeStore
}

extension Digits01Button: View {
  var body: some View {
    Button(action: action) {
          HStack(spacing: 20) {
            Image(viewModel.output.fillType.ngramImageName)
              .resizable()
              .frame(width: 50, height: 50)

            VStack (alignment: .leading) {
              Text("\(viewModel.digit.rawValue)")
                .frame(maxWidth: .infinity,
                       alignment: .leading)
              Text(viewModel.numbersDescription)
                .font(.caption)
            }
          }
        }
        .padding(.horizontal, 30)
  }
}

#Preview {
  Digits01Button(viewModel: .init(digit: .eight),
                 action: {
    print("押されました！")
  })
}
