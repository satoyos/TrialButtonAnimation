//
//  MinSec.ViewModel.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2024/07/27.
//

import Foundation
import Combine
import AVFoundation


extension MinSec {
    class ViewModel: ObservableObject {
        @Published private(set) var timeTexts: (min: String, sec: String) = ("00", "00")
        private var timer: CountDownTimer
        private var startTime: CGFloat
        private var interval: CGFloat
        private var cancellables = Set<AnyCancellable>()
        private let action2minLeft: () -> Void
        static let player2minites = AudioPlayerFactory.shared.preparePlayer(folder: "audio/sasara", file: "2minutesLeft", title: "競技開始2分前")

        
        init(startTime: CGFloat, interval: CGFloat, action2minLeft: @escaping () -> Void = declare2minutesLeft) {
            self.startTime = startTime
            self.interval = interval
            self.action2minLeft = action2minLeft
            self.timer = CountDownTimer(startTime: startTime, intarval: interval)
            self.timeTexts = timeTexts(of: startTime)
            buildDataFlow()
            AudioPlayerFactory.shared.setupAudioSession()
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
                    let timeTexts = timeTexts(of: value)
                    if timeTexts == ("2", "00") {
                        self.action2minLeft()
                    }
                    self.timeTexts = timeTexts
                }
                .store(in: &cancellables)
        }
        
        private func timeTexts(of time: CGFloat) -> (min: String, sec: String) {
            (min: minString(from: time), sec: secString(from: time))
        }
        
        private func minString(from remainTime: CGFloat) -> String {
            "\(Int(remainTime) / 60)"
        }
        
        private func secString(from remainTime: CGFloat) -> String {
            String(format: "%02d", Int(remainTime) % 60)
        }
        
        static private func declare2minutesLeft() {
            player2minites.currentTime = 0.0
            player2minites.play()
        }
    }
}
