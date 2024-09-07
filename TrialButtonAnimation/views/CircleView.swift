//
//  CircleView.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2024/07/13.
//

import SwiftUI

struct CircleView: View {
    @State private var isPressed: Bool = false

    var body: some View {
        Circle()
            .fill(Color.green)
            .scaleEffect(isPressed ? 0.9 : 1)
            .animation(isPressed ? .linear : .interactiveSpring(response: 0.35, dampingFraction: 0.3), value: isPressed)
            .simultaneousGesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { _ in
                        isPressed = true
                    }
                    .onEnded { _ in
                        isPressed = false
                    }
            )
    }
}

#Preview {
    CircleView()
        .frame(width: 200, height: 200)
        
}
