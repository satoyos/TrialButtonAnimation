//
//  MinSec.ViewModel.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2024/07/27.
//

import Foundation
import Combine

extension MinSec {
    class ViewModel: ObservableObject {
        @Published private(set) var minText: String = "00"
        @Published private(set) var secText: String = "00"
        private var timer: CountDownTimer
        private var startTime: CGFloat
        private var interval: CGFloat
        private var cancellables = Set<AnyCancellable>()
        
        init(startTime: CGFloat, interval: CGFloat) {
            self.startTime = startTime
            self.interval = interval
            self.timer = CountDownTimer(startTime: startTime, intarval: interval)
            self.minText = minString(from: startTime)
            self.secText = secString(from: startTime)
            buildDataFlow()
        }
        
        func startTimer() {
            timer.start()
        }
        
        private func buildDataFlow() {
            timer.$remainTime
                .dropFirst()
                .sink { [weak self] value in
                    guard let self = self else { return }
                    self.minText = minString(from: value)
                    self.secText = secString(from: value)
                }
                .store(in: &cancellables)
        }
        
        private func minString(from remainTime: CGFloat) -> String {
            "\(Int(remainTime) / 60)"
        }
        
        private func secString(from remainTime: CGFloat) -> String {
            String(format: "%02d", Int(remainTime) % 60)
        }
    }
}
