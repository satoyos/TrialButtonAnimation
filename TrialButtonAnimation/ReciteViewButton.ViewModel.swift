//
//  ReciteViewButton.ViewModel.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2024/07/21.
//

extension ReciteViewButton {
    class ViewModel {
        var type: LabelType
        var pushedAction: (() -> Void)?
        
        init(type: LabelType = .play) {
            self.type = type
        }
    }
}
