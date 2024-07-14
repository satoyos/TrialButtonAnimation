//
//  CircleButtonView.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2024/07/13.
//

import SwiftUI

struct CircleButtonView {
    let type: LabelType
    let diameter: Double
    @State private var isPressed: Bool = false
    
    init(type: LabelType = .play, diameter: Double = 200, isPressed: Bool = false) {
        self.type = type
        self.diameter = diameter
        self.isPressed = isPressed
    }
}

extension CircleButtonView: View {
    var body: some View {
        Button {
            print("Button Tapped")
        } label: {
            Image(systemName: name(of: type))
                .resizable()
                .padding(insets(of: type))
                .frame(width: markSize, height: markSize)
                .imageScale(.large)
                .foregroundColor(.cyan)
                .overlay {
                    Circle()
                        .stroke(Color.black, lineWidth: 2)
                        .frame(width: diameter, height: diameter)
                }
        }
        .scaleEffect(isPressed ? 0.9 : 1)
        .animation(isPressed ? .linear : .interactiveSpring(response: 0.35, dampingFraction: 0.3), value: isPressed)
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in isPressed = true }
                .onEnded { _ in isPressed = false }
        )
    }
}

extension CircleButtonView {
    private var markSize: Double {
        diameter * 0.5
    }
    
    private var markOffset: Double {
        diameter * 5 / 160
    }
}

extension CircleButtonView {
    enum LabelType: String {
        case play
        case pause
        case forward
        case rewind
    }
}

extension CircleButtonView {
    private func labelConfig(of type: LabelType) -> (imageName: String, paddingInsets: EdgeInsets) {
        switch type {
        case .play:
            return (imageName: "play.fill",
                    paddingInsets: EdgeInsets(top: 0, leading: markOffset * 3, bottom: 0, trailing: -1 * markOffset))
        case .pause:
            return (imageName: "pause.fill",
                    paddingInsets: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        case .forward:
            return (imageName: "forward.fill",
                    paddingInsets: EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: -1 * markOffset))
        case .rewind:
            return (imageName: "backward.fill",
                    paddingInsets: EdgeInsets(top: 0, leading: -1 * markOffset, bottom: 0, trailing: markOffset))
        }
    }
    
    private func name(of type: LabelType) -> String {
        labelConfig(of: type).imageName
    }
    
    private func insets(of type: LabelType) ->  EdgeInsets {
        labelConfig(of: type).paddingInsets
    }
}

#Preview {
    CircleButtonView(type: .forward, diameter: 300)
}
