//
//  FiveColorButton.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2025/03/29.
//

import SwiftUI

struct FiveColorButton: View {
    var body: some View {
      Button(action: {print("押されたし！")}) {
        HStack(spacing: 20){
          Image("5ColorHalf")
            .renderingMode(.template)
            .foregroundColor(.pink)
          Text("桃(ピンク)")
            .font(.title2)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
      }
      .padding(.horizontal, 50)
      
    }
}

#Preview {
    FiveColorButton()
}
