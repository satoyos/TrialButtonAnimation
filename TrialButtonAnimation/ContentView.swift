//
//  ContentView.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2024/05/17.
//
import SwiftUI


struct ContentView: View {

    var body: some View {
//        CircleView()
        ReciteViewButton(type: .forward, diameter: 250) {}
    }
}

#Preview {
    ContentView()
}
