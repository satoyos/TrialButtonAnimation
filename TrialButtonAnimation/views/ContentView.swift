//
//  ContentView.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2024/05/17.
//
import SwiftUI


struct ContentView: View {

    var body: some View {
        NavigationView {
            MenuList(settings: Settings())
        }
        .navigationTitle("画面一覧")
        .environmentObject(ScreenSizeStore())
    }
}

#Preview {
    ContentView()
}
