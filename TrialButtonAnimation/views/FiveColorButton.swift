//
//  FiveColorButton.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2025/03/29.
//

import SwiftUI

struct FiveColorButton {
  let ofColor: FiveColors
}

extension FiveColorButton: View {
    var body: some View {
      Button(action: {print("押されたし！")}) {
        HStack(spacing: 20){
          Image("5ColorHalf")
            .renderingMode(.template)
            .foregroundColor(ofColor.color)
          Text(ofColor.description)
            .font(.title2)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
      }
      .padding(.horizontal, 50)
      
    }
}

#Preview {
  FiveColorButton(ofColor: .yellow)
}
