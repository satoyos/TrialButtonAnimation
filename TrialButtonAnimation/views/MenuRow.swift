//
//  MenuRow.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2024/09/08.
//

import SwiftUI

struct MenuRow {
    let viewModel: ViewModel
}

extension MenuRow: View {
    var body: some View {
        HStack {
            Text(viewModel.text)
            Spacer()
            Text(viewModel.valueText)
        }
    }
}

#Preview {
    MenuRow(viewModel:
            .init(item: MenuItem(
                title: "暗記時間タイマー",
                value: nil)))
}
