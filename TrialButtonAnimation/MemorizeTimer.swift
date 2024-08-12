//
//  MemorizeTimer.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2024/07/27.
//

import SwiftUI

struct MemorizeTimer {
    @ObservedObject var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
}

extension MemorizeTimer: View {
    var body: some View {
        VStack {
            MinSec(digitSize: 100, viewModel: viewModel.timeViewModel)
            RecitePlayButton(diameter: 150, viewModel: viewModel.buttonViewModel)
                .disabled(viewModel.isButtonDisabled)
        }
    }
}

#Preview {
    MemorizeTimer(
        viewModel: .init(totalSec: 11,
                         completion: {print("** All finished **")}))
}
