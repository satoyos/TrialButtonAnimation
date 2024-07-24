//
//  RecitePlayButton.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2024/07/22.
//

import SwiftUI

struct RecitePlayButton {
    @ObservedObject var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
}

extension RecitePlayButton: View {
    var body: some View {
        ReciteViewButton(type: viewModel.type, diameter: 300) {
            viewModel.playButtonTapped()
        }
    }
}

#Preview {
    RecitePlayButton(viewModel: RecitePlayButton.ViewModel(type: .play))
}
