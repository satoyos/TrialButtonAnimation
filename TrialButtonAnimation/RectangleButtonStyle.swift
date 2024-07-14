//
//  RectangleButtonStyle.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2024/05/17.
//

import SwiftUI

struct RectangleButtonStyle: ButtonStyle {
    let size: Size

    enum Size {
        case large
        case small

        var fontSize: CGFloat {
            switch self {
            case .large: return 14
            case .small: return 12
            }
        }

        var width: CGFloat {
            switch self {
            case .large: return 200
            case .small: return 100
            }
        }

        var height: CGFloat {
            switch self {
            case .large: return 40
            case .small: return 16
            }
        }
    }

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: size.fontSize))
            .frame(width: size.width, height: size.height)
    }
}

struct RectangleButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Button(action: {
                print("hoge")
            }, label: {
                Text("Button")
            })
            .padding()
            .background(Color.white)
            .buttonStyle(RectangleButtonStyle(size: .large))

            
        }
        .padding()
        .background(Color.gray)
        .previewLayout(.sizeThatFits)
    }
}
