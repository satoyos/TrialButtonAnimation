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
        let minutes: CGFloat
        @ObservedObject var timeViewModel: MinSec.ViewModel
        @ObservedObject var buttonViewModel: RecitePlayButton.ViewModel
        private var cancellables = Set<AnyCancellable>()
        
        init(minutes: CGFloat) {
            self.minutes = minutes
            self.timeViewModel = .init(startTime: minutes * 60, interval: 1)
            self.buttonViewModel = .init(type: .play)
            buildDataFlow()
        }
        
        private func buildDataFlow() {
            buttonViewModel.$type
                .dropFirst()
                .print("In Memorize Timer:")
                .sink { [weak self] value in
                    if value == .pause {
                        self?.timeViewModel.startTimer()
                    } else {
                        self?.timeViewModel.stopTimer()
                    }
                }
                .store(in: &cancellables)
        }
        
    }
}
