//
//  MemorizeTimer.ViewModel.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2024/07/27.
//

import Foundation
import SwiftUI
import Combine

extension MemorizeTimer {
    class ViewModel {
        let totalSec: CGFloat
        @ObservedObject var timeViewModel: MinSec.ViewModel
        @ObservedObject var buttonViewModel: RecitePlayButton.ViewModel
        private let action2minLeft: () -> Void
        static let player2minites = AudioPlayerFactory.shared.preparePlayer(folder: "audio/sasara", file: "2minutesLeft", title: "競技開始2分前")

        private var cancellables = Set<AnyCancellable>()
        
        init(totalSec: CGFloat, action2minLeft: @escaping () -> Void = announce2minutesLeft) {
            if let secStr = ProcessInfo.processInfo.environment["MEMORIZE_TIME_IN_SEC"],
                let secDouble = Double(secStr) {
                print("*** secStr in environment -> \(secStr)")
                self.totalSec = CGFloat(secDouble)
            } else {
                print("xxx The environment variable is not set")
                self.totalSec = totalSec
            }
            self.timeViewModel = .init(startTime: self.totalSec, interval: 1)
            self.buttonViewModel = .init(type: .play)
            self.action2minLeft = action2minLeft
            buildDataFlow()
        }
        
        convenience init(minutes: CGFloat) {
            let startTime = minutes * 60
            self.init(totalSec: startTime)
        }
        
        private func buildDataFlow() {
            buttonViewModel.$type
                .dropFirst()
                .sink { [weak self] value in
                    if value == .pause {
                        self?.timeViewModel.startTimer()
                    } else {
                        self?.timeViewModel.stopTimer()
                    }
                }
                .store(in: &cancellables)
            
            timeViewModel.$timeTexts
                .dropFirst()
                .print("In Memorize Timer:")
                .sink { [weak self] timeTexts in
                    if timeTexts == ("2", "00") {
                        self?.action2minLeft()
                    }
                }.store(in: &cancellables)
        }
        
        static private func announce2minutesLeft() {
            player2minites.currentTime = 0.0
            player2minites.play()
        }
    }
}
