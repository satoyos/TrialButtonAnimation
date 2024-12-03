//
//  DurationSetting.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2024/08/24.
//

import SwiftUI

struct DurationSetting {
    @ObservedObject private var viewModel: DurationSettingViewModel
    @EnvironmentObject var screenSizeStore: ScreenSizeStore

    init(startTime: Double) {
        self.viewModel = DurationSettingViewModel(startTime: startTime)
    }
}

extension DurationSetting: View {
    var body: some View {
        VStack(spacing: digitSize / 4) {
            Sec2F(digitSize: 100, viewModel: viewModel.timeViewModel)
            Slider(value: viewModel.$binding.startTime, in: 0.5 ... 2.0, step: 0.02 )
        
                .padding(.horizontal)
            Button("試しに聞いてみる") {
                viewModel.input.startTrialCountDownRequest.send()
            }
        }
    }
    
    private var digitSize: Double {
        screenSizeStore.screenWidth / 5.0
    }
}

#Preview {
    DurationSetting(startTime: 1.1)
        .environmentObject(ScreenSizeStore())
}
