//
//  ContentView.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2024/05/17.
//
import SwiftUI


struct ContentView: View {

    var body: some View {
//        MemorizeTimer(viewModel: .init(minutes: 3))
        SecTimerWithButton(startTime: 2.0)
            .environmentObject(ScreenSizeStore())
    }
}

#Preview {
    ContentView()
}
