//
//  SettingsPublishingWrapper.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2024/12/04.
//

import Combine

final class SettingsPublishingWrapper: ObservableObject {
    @Published private(set) var somethingChanged = PassthroughSubject<Void, Never>()
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
            somethingChanged.send()
            objectWillChange.send()
        }
    }
}
