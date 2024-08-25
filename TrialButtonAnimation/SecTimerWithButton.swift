//
//  SecTimerWIthButton.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2024/08/25.
//

import SwiftUI

struct SecTimerWithButton {
    @State private var startTime: Double
    private var viewModel: ViewModel
    
    init(startTime: Double) {
        self.startTime = startTime
        self.viewModel = ViewModel(startTime: startTime)
    }
}

extension SecTimerWithButton: View {
    var body: some View {
        VStack {
            Text(String(format: "%.2F", startTime))
                .font(.largeTitle)
            Slider(value: Binding(
                get: {
                    startTime
                },
                set: { newValue in
                    self.startTime = newValue
                    viewModel.updateStartTime(to: newValue)
                }), in: 1.5 ... 3.0)
            .padding(.horizontal)
            Sec2F(digitSize: 80, viewModel: viewModel.timeViewModel)
            Button(viewModel.buttonText) {
                viewModel.timeViewModel.startTimer()
            }
        }
    }
}

#Preview {
    SecTimerWithButton(startTime: 2.3)
}
