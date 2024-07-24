//
//  RecitePlayButton.ViewModel.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2024/07/23.
//

import Combine

extension RecitePlayButton {
    class ViewModel: ObservableObject {
        @Published private(set) var type: ReciteViewButton.LabelType
        private(set) var isWaitingForPlay: Bool
        
        init(type: ReciteViewButton.LabelType = .play) {
            self.type = type
            self.isWaitingForPlay = type == .play ? true : false
        }
        
        func playButtonTapped() {
            self.isWaitingForPlay.toggle()
            self.type = isWaitingForPlay ? .play : .pause
        }
        
    }
}
