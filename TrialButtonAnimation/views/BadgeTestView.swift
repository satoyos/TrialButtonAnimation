//
//  BadgeTestView.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2025/04/20.
//

import SwiftUI

struct BadgeTestView {
  @State private var value = 0
}

extension BadgeTestView: View {
  var body: some View {
    VStack {
      BadgeView(number: value)
      Button("数値を変更") {
        value += 1
      }
      .padding(.top, 40)
    }
  }
}

#Preview {
    BadgeTestView()
}
