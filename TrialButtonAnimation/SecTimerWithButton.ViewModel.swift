//
//  SecTimerWithButton.ViewModel.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2024/08/25.
//

// import Combine
import AVFoundation
import Combine

extension SecTimerWithButton {
    class ViewModel: NSObject, ObservableObject, AVAudioPlayerDelegate {
        let buttonText = "試しに聞いてみる"
        @Published private(set) var timeViewModel: Sec2F.ViewModel
        @Published private(set) var isTimerRunning: Bool
        @Published private(set) var isUserActionDisabled = false
        let player1: AVAudioPlayer
        let player2: AVAudioPlayer
        private var cancellables = Set<AnyCancellable>()
        
        var startTime: Double {
            timeViewModel.startTime
        }
        
        enum HalfPoem: String {
            case h001a
            case h001b
            case h002a
        }
        
        init(startTime: Double, halfPoem1: HalfPoem = .h001a, halfPoem2: HalfPoem = .h001b) {
            let timeViewModel = Sec2F.ViewModel(startTime: startTime, interval: 0.02)
            self.timeViewModel = timeViewModel
            self.isTimerRunning = timeViewModel.isTimerRunning
            self.player1 = Self.fetchInabaPlayer(of: halfPoem1)
            self.player2 = Self.fetchInabaPlayer(of: halfPoem2)
            super.init()
//            buildPipeline()
            AudioPlayerFactory.shared.setupAudioSession()
        }
        
        private static func fetchInabaPlayer(of halfPoem: HalfPoem) -> AVAudioPlayer {
            let filename = String(halfPoem.rawValue.dropFirst())
            return AudioPlayerFactory.shared.preparePlayer(folder: "audio/inaba", file: filename, title: filename)
        }
        
        private func buildPipeline() {
            timeViewModel.$isTimerRunning
                .assign(to: &$isTimerRunning)
            
            timeViewModel.$isTimerRunning
                .print("isTimerRugging[2] in SecTimer.ViewModel")
                .dropFirst() // drop first "false"
                .filter { $0 == false }
                .sink { [weak self] _ in
                    guard let self = self else { return }
                    self.startPlaying(self.player2)
                }
                .store(in: &cancellables)
        }
        
        func updateStartTime(to newTime: Double) {
            self.timeViewModel = .init(startTime: newTime, interval: 0.02)
        }
        
        func startTimer() {
            buildPipeline()
            timeViewModel.startTimer()
        }
        
        func startTrialCountDown() {
            self.isUserActionDisabled = true
            startPlaying(player1)
        }
        
        func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
            switch player {
            case player1:
                startTimer()
            case player2:
                print("player2 completed playing")
            default:
                break
            }
        }
        
        private func startPlaying(_ player: AVAudioPlayer) {
            player.delegate = self
            player.currentTime = 0.0
            player.play()
        }
        
    }
    
    
}
