//
//  SecTimerWithButton.ViewModel.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2024/08/25.
//

import Foundation

extension SecTimerWithButton {
    class ViewModel {
        let buttonText = "カウントダウン開始"
        private(set) var startTime: Double
        private(set) var timeViewModel: Sec2F.ViewModel
        
        init(startTime: Double) {
            self.startTime = startTime
            self.timeViewModel = .init(startTime: startTime, interval: 0.02)
        }
        
        func updateStartTime(to newTime: Double) {
            self.startTime = newTime
            self.timeViewModel = .init(startTime: startTime, interval: 0.02)
        }
    }
}