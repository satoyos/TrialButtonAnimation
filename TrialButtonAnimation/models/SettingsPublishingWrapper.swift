//
//  SettingsPublishingWrapper.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2024/12/04.
//

import Combine

final class SettingsPublishingWrapper: ObservableObject {
    private let settings: Settings
    
    init(settings: Settings) {
        self.settings = settings
    }
    
    var interval: Float {
        get {
            return settings.interval
        }
        set(t) {
            settings.interval = t
            objectWillChange.send()
        }
    }
}
