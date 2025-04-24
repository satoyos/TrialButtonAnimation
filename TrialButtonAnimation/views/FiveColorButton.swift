//
//  FiveColorButton.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2025/03/29.
//

import SwiftUI

struct FiveColorButton {
  let ofColor: FiveColors
  let fillType: FillType
  let action: () -> Void
  @EnvironmentObject var screenSizeStore: ScreenSizeStore
}

extension FiveColorButton: View {
  var body: some View {
    Button(action: action) {
      HStack(spacing: 20){
        Image(fillType.imageName)
          .resizable()
          .renderingMode(.template)
          .foregroundColor(ofColor.color)
          .frame(width: imageHeight, height: imageHeight)
        Text(ofColor.description)
          .font(.title2)
          .frame(maxWidth: .infinity, alignment: .leading)
      }
    }
    .padding(.horizontal, 50)
//    .background(Color.cyan)
    

  }
  private var imageHeight: CGFloat {
    screenSizeStore.screenHeight / 10.0
  }
}

#Preview {
  FiveColorButton(ofColor: .yellow, fillType: .full) {
    print("押されたよん")
  }
    .environmentObject(ScreenSizeStore())
}
