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
        @Published private(set) var timeTexts: (min: String, sec: String) = ("00", "00")
        private var timer: CountDownTimer
        private var startTime: CGFloat
        private var interval: CGFloat
        private var cancellables = Set<AnyCancellable>()
        
        init(startTime: CGFloat, interval: CGFloat) {
            self.startTime = startTime
            self.interval = interval
            self.timer = CountDownTimer(startTime: startTime, intarval: interval)
            self.timeTexts = (min: minString(from: startTime),
                          sec: secString(from: startTime))
            buildDataFlow()
        }
        
        var minText: String {
            timeTexts.min
        }
        
        var secText: String {
            timeTexts.sec
        }
        
        func startTimer() {
            timer.start()
        }
        
        func stopTimer() {
            timer.stop()
        }
        
        private func buildDataFlow() {
            timer.$remainTime
                .dropFirst()
                .sink { [weak self] value in
                    guard let self = self else { return }
                    self.timeTexts = (min: minString(from: value),
                                  sec: secString(from: value))
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
