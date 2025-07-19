////
////  Digits10Button.swift
////  TrialButtonAnimation
////
////  Created by Yoshifumi Sato on 2025/07/06.
////
//
//import SwiftUI
//
//struct Digits10Button {
//  @ObservedObject var viewModel: DigitsButtonViewModel<Digits10>
//  let action: () -> Void
//  
//}
//
//extension Digits10Button: View {
//  var body: some View {
//    Button(action: action) {
//      HStack(spacing: 20) {
//        Image(viewModel.output.fillType.ngramImageName)
//          .resizable()
//          .frame(width: 50, height: 50)
//        
//        VStack (alignment: .leading) {
//          Text("\(viewModel.digit.rawValue)")
//            .frame(maxWidth: .infinity,
//                   alignment: .leading)
//          Text(viewModel.numbersDescription)
//            .font(.caption)
//        }
//      }
//    }
//    .padding(.horizontal, 30)
//  }
//}
//
//#Preview {
//  Digits10Button(viewModel: .init(digit: .seven)) {
//    print("押された！")
//  }
//}
