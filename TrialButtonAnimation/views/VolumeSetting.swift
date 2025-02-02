//
//  VolumeSetting.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2025/01/25.
//

import SwiftUI

struct VolumeSetting {
  @ObservedObject private var viewModel: VolumeSettingViewModel
  @EnvironmentObject var screenSizeStore: ScreenSizeStore
  
  init(viewModel: VolumeSettingViewModel) {
    self.viewModel = viewModel
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
        .font(.system(size: digitSize / 4, weight: .medium))
    }
    .padding()
    
    Slider(value: viewModel.$binding.volume, in: 0.01 ... 1.0, step: 0.01)
      .padding(.horizontal)
    
    Button("試しに聞いてみる") {
      viewModel.input.startTestRecitingRequest.send()
    }
    .buttonStyle(.borderedProminent)
    .foregroundStyle(Color.white)
    .padding(.top)
    .disabled(viewModel.output.isButtonDisabled)
    
  }
  
  private var digitSize: Double {
      screenSizeStore.screenWidth / 5.0
  }
}

#Preview {
  VolumeSetting(viewModel: .init(
    volume: 0.5,
    singer: Singers.defaultSinger))
    .environmentObject(ScreenSizeStore())
}
