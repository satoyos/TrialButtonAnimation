//
//  MinSecView.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2024/07/19.
//

import SwiftUI

// Viewが、アプリ画面のどれくらいを占めたいか。
private let occupyRatio: CGFloat = 3.0 / 4.0

struct MinSec {
    let digitSize: CGFloat
    let unitSize: CGFloat

    @EnvironmentObject var screenSizeStore: ScreenSizeStore
    
    init(digitSize: CGFloat) {
        self.digitSize = digitSize
        self.unitSize = digitSize / 4
    }
}

extension MinSec: View {
    var body: some View {
        HStack (spacing: 0) {
            HStack (alignment: .bottom, spacing: 0) {
                Text("22")
                    .monospacedDigit()
                    .font(.system(size: digitSize, weight: .medium))
//                    .background(Color.green)
                Text("分")
                    .font(.system(size: unitSize, weight: .medium))
//                    .background(Color.white)
            }
//            .background(Color.cyan)
            HStack (alignment: .bottom, spacing: 0) {
                Text("02")
                    .monospacedDigit()
                    .font(.system(size: digitSize, weight: .medium))
                Text("秒")
                    .font(.system(size: unitSize, weight: .medium))
            }
//            .background(Color.mint)
        }
    }
}

#Preview {
    MinSec(digitSize: 100)
        .environmentObject(ScreenSizeStore())
}