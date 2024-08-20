//
//  Sec2F.ViewModel.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2024/08/20.
//

import Foundation

extension Sec2F {
    class ViewModel: ObservableObject {
        @Published private(set) var secText: String
        private let startTime: CGFloat
        private let interval: CGFloat
        
        init(startTime: CGFloat, interval: CGFloat) {
            self.startTime = startTime
            self.interval = interval
            self.secText = Self.strOf(time: startTime)
        }
        
        private static func strOf(time: CGFloat) -> String {
            String(format: "%.2F", time)
        }
    }
}
