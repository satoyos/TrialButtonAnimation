//
//  SecTimerWIthButton.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2024/08/25.
//

import SwiftUI

struct SecTimerWithButton {
}

extension SecTimerWithButton: View {
    var body: some View {
        VStack {
            let timeViewModel = Sec2F.ViewModel(startTime: 2.2, interval: 0.02)
            Sec2F(digitSize: 80, viewModel: timeViewModel)
            Button("カウントダウン開始") {
                timeViewModel.startTimer()
            }
        }
    }
}

#Preview {
    SecTimerWithButton()
}
