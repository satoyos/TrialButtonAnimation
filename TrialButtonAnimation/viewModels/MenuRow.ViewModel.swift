//
//  MenuRow.ViewModel.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2024/09/08.
//

import Foundation

extension MenuRow {
    struct ViewModel {
        let item: MenuItem
        
        var text: String {
            item.title
        }
        
        var valueText: String {
            if let value = item.value {
                return String(format: "%.2F", value)
            } else {
                return ""
            }
        }
    }
}
