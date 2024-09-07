//
//  Sec2F.ViewModel.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2024/08/20.
//

import Foundation

extension Sec2F {
    class ViewModel: ObservableObject {
        @Published private(set) var secText: String
        @Published private(set) var isTimerRunning: Bool
        private(set) var startTime: CGFloat
        private let interval: CGFloat
        private var timer: CountDownTimer
        
        init(startTime: CGFloat, interval: CGFloat) {
            self.startTime = startTime
            self.interval = interval
            self.secText = Self.strOf(time: startTime)
            self.timer = CountDownTimer(startTime: startTime, intarval: interval)
            self.isTimerRunning = timer.isRunning
            buildPipeline()
        }
        
        private static func strOf(time: CGFloat) -> String {
            String(format: "%.2F", time)
        }
        
        private func buildPipeline() {
            timer.$remainTime
                .dropFirst()
                .map{Self.strOf(time: $0)}
                .assign(to: &$secText)
            
            timer.$isRunning
                .assign(to: &$isTimerRunning)
        }
        
        func startTimer() {
            timer.start()
        }
    }
}
