//
//  MenuItem.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2024/09/08.
//

import Foundation

struct MenuItem: Hashable, Identifiable {
    var id = UUID()
    let title: String
    let value: String?
    
    init(title: String, value: String? = nil) {
        self.title = title
        self.value = value
    }
}
