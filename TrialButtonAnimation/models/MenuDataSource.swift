//
//  MenuDataSource.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2024/09/08.
//

import Foundation

struct MenuDataSource {
    let settings: Settings
    
    var sections: [MenuSection] {
        [
            MenuSection(category: "画面サンプル",
                    items: [
                        MenuItem(title: "暗記時間タイマー"),
                        MenuItem(title: "時間間隔",
                                 value: Double( settings.interval))
                    ])
        ]
    }
}
