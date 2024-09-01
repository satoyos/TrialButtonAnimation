//
//  SecTimerWithButton.ViewModel.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2024/08/25.
//

import Combine
import AVFoundation

extension SecTimerWithButton {
    class ViewModel: ObservableObject {
        let buttonText = "試しに聞いてみる"
        private(set) var startTime: Double
        @Published private(set) var timeViewModel: Sec2F.ViewModel
        private var cancellables = Set<AnyCancellable>()
        let player1: AVAudioPlayer
        let player2: AVAudioPlayer
        
        enum HalfPoem: String {
            case h001a
            case h001b
            case h002a
        }
        
        init(startTime: Double, halfPoem1: HalfPoem = .h001a, halfPoem2: HalfPoem = .h001b) {
            self.startTime = startTime
            self.timeViewModel = .init(startTime: startTime, interval: 0.02)
            self.player1 = Self.fetchInabaPlayer(of: halfPoem1)
            self.player2 = Self.fetchInabaPlayer(of: halfPoem2)
            
            AudioPlayerFactory.shared.setupAudioSession()
        }
        
        private static func fetchInabaPlayer(of halfPoem: HalfPoem) -> AVAudioPlayer {
            let filename = String(halfPoem.rawValue.dropFirst())
            return AudioPlayerFactory.shared.preparePlayer(folder: "audio/inaba", file: filename, title: filename)
        }
        
        func updateStartTime(to newTime: Double) {
            self.startTime = newTime
            self.timeViewModel = .init(startTime: startTime, interval: 0.02)
        }
        
        func startTimer() {
            timeViewModel.startTimer()
        }
        
        func startTrialCountDown() {
            player1.currentTime = 0.0
            player1.play()
        }
        
    }
    
    
}
