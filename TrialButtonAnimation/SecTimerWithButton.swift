//
//  SecTimerWIthButton.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2024/08/25.
//

import SwiftUI

struct SecTimerWithButton {
    @ObservedObject private var viewModel: ViewModel
    @EnvironmentObject var screenSizeStore: ScreenSizeStore
    
    init(startTime: Double) {
        self.viewModel = ViewModel(startTime: startTime)
    }
}

extension SecTimerWithButton: View {
    var body: some View {
        
        VStack(spacing: digitSize / 4) {
            Spacer()
            Sec2F(digitSize: digitSize, viewModel: viewModel.timeViewModel)
            Slider(value: Binding(
                get: {
                    viewModel.startTime
                },
                set: { newValue in
                    viewModel.updateStartTime(to: newValue)
                }), in: 1.5 ... 3.0, step: 0.02)
            .padding(.horizontal, digitSize / 2)
            Button(viewModel.buttonText) {
                viewModel.startTimer()
            }
            .padding(.top, digitSize / 1.5)
            Spacer()
            Spacer()
        }
    }
    
    private var digitSize: Double {
        screenSizeStore.screenWidth / 5.0
    }
}

#Preview {
    SecTimerWithButton(startTime: 2.3)
    .environmentObject(ScreenSizeStore())
}
