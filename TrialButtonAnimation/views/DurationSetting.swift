//
//  DurationSetting.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2024/08/24.
//

import SwiftUI

struct DurationSetting {
    @State private var sliderValue: Double = 2.0
}

extension DurationSetting: View {
    var body: some View {
        VStack {
            let sec2fViewModel = Sec2FViewModel(startTime: sliderValue, interval: 0.02)
            Sec2F(digitSize: 100, viewModel: sec2fViewModel)
            Slider(value: Binding(
                get: {
                    sliderValue
                }, set: { newValue in
                    self.sliderValue = newValue
                }), in: 1.5 ... 3.0, step: 0.02 )
        
                .padding(.horizontal)
            Button("試しに聞いてみる") {
                sec2fViewModel.input.startTimerRequest.send()
            }
        }
    }
}

#Preview {
    DurationSetting()
}
