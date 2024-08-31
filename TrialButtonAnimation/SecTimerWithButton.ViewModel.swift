//
//  SecTimerWithButton.ViewModel.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2024/08/25.
//

import Combine

extension SecTimerWithButton {
    class ViewModel: ObservableObject {
        let buttonText = "カウントダウン開始"
        private(set) var startTime: Double
        @Published private(set) var timeViewModel: Sec2F.ViewModel
        private let subject = PassthroughSubject<Void, Never>()
        private var cancellables = Set<AnyCancellable>()
        
        init(startTime: Double) {
            self.startTime = startTime
            self.timeViewModel = .init(startTime: startTime, interval: 0.02)
            
        }
        
        private func buildPipeline() {
            timeViewModel.$secText
                .sink {[weak self] string in
                    self?.subject.send()
                }
                .store(in: &cancellables)
        }
        
        func updateStartTime(to newTime: Double) {
            self.startTime = newTime
            self.timeViewModel = .init(startTime: startTime, interval: 0.02)
        }
        
        func startTimer() {
            timeViewModel.startTimer()
        }
    }
}
