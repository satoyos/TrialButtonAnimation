//
//  VolumeSetting.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2025/01/25.
//

import SwiftUI

struct VolumeSetting {
  let digitSize: CGFloat
  let unitSize: CGFloat
  @ObservedObject private var viewModel: VolumeSettingViewModel
  
  init(digitSize: CGFloat    = 100, volume: Double) {
    self.viewModel = .init(volume: volume)
    self.digitSize = digitSize
    self.unitSize = digitSize / 4
  }
}

extension VolumeSetting: View {
  var body: some View {
    HStack(alignment: .bottom, spacing: 0) {
      ZStack(alignment: .trailing) {
        Text("100")
          .monospacedDigit()
          .font(.system(size: digitSize+8, weight: .medium))
          .opacity(0)
        Text(viewModel.output.ratioText)
          .monospacedDigit()
          .font(.system(size: digitSize, weight: .medium))
      }
      Text("%")
        .font(.system(size: unitSize, weight: .medium))
      
      
    }
  }
}

#Preview {
  VolumeSetting(volume: 1)
}
