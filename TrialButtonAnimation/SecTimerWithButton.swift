//
//  SecTimerWIthButton.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2024/08/25.
//

import SwiftUI

struct SecTimerWithButton {
    @ObservedObject private var viewModel: ViewModel
    
    init(startTime: Double) {
        self.viewModel = ViewModel(startTime: startTime)
    }
}

extension SecTimerWithButton: View {
    var body: some View {
        VStack {
            Sec2F(digitSize: 80, viewModel: viewModel.timeViewModel)
            Slider(value: Binding(
                get: {
                    viewModel.timeViewModel.startTime
                },
                set: { newValue in
                    viewModel.updateStartTime(to: newValue)
                }), in: 1.5 ... 3.0, step: 0.02)
            .padding(.horizontal)
            Button(viewModel.buttonText) {
                viewModel.startTimer()
            }
            .padding(.vertical)
        }
    }
}

#Preview {
    SecTimerWithButton(startTime: 2.3)
}
