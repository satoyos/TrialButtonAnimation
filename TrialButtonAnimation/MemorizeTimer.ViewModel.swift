//
//  MemorizeTimer.ViewModel.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2024/07/27.
//

import Foundation
import SwiftUI
import Combine
import AVFoundation

extension MemorizeTimer {
    class ViewModel {
        let totalSec: CGFloat
        @ObservedObject var timeViewModel: MinSec.ViewModel
        @ObservedObject var buttonViewModel: RecitePlayButton.ViewModel
        private var action2minLeft: (() -> Void)? = nil
        private var actionTimeOver: (() -> Void)? = nil
        let player2minites = AudioPlayerFactory.shared.preparePlayer(folder: "audio/sasara", file: "2minutesLeft", title: "競技開始2分前")
        let playerStgartGame = AudioPlayerFactory.shared.preparePlayer(folder: "audio/sasara", file: "timeToStartGame", title: "暗記時間終了")
        private var cancellables = Set<AnyCancellable>()
        
        init(totalSec: CGFloat, 
             action2minLeft: (() -> Void)? = nil,
             actionTimeOver: (() -> Void)? = nil) {
            if let secStr = ProcessInfo.processInfo.environment["MEMORIZE_TIME_IN_SEC"],
                let secDouble = Double(secStr) {
                self.totalSec = CGFloat(secDouble)
            } else {
                print("xxx The environment variable is not set")
                self.totalSec = totalSec
            }
            self.timeViewModel = .init(startTime: self.totalSec, interval: 1)
            self.buttonViewModel = .init(type: .play)
            self.action2minLeft = action2minLeft ?? announce2minutesLeft
            self.actionTimeOver = actionTimeOver ?? announceMemorizeTimeIsOver
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
                    switch timeTexts {
                    case ("2", "00"):
                        self?.action2minLeft?()
                    case ("0", "00"):
                        self?.actionTimeOver?()
                    default:
                        break
                    }
                }.store(in: &cancellables)
        }
        
        private func announce2minutesLeft() {
            player2minites.currentTime = 0.0
            player2minites.play()
        }
        
        private func announceMemorizeTimeIsOver() {
            playerStgartGame.currentTime = 0.0
            // ここをどうするかが、次の課題！
//             playerStgartGame.delegate = AudioPlayerDelegate()
            playerStgartGame.play()
        }
    }
    
}


