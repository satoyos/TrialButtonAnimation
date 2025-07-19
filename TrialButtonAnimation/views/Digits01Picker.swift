////
////  DigitsPicker01.swift
////  TrialButtonAnimation
////
////  Created by Yoshifumi Sato on 2025/06/28.
////
//
//import SwiftUI
//
//struct Digits01Picker {
//  let settings: Settings
//  @ObservedObject private var viewModel: DigitsPickerViewModel<Digits01>
//  @Environment(\.isPresented) private var isPresented
//  
//  init(settings: Settings) {
//    self.settings = settings
//    self.viewModel = .init(state100: settings.state100)
//  }
//}
//
//extension Digits01Picker: View {
//  var body: some View {
//    NavigationStack {
//      List {
//        ForEach(Digits01.allCases) { digit in
//          DigitsButton<Digits01>(viewModel: digit.buttonViewModel) {
//            viewModel.input.digitButtonTapped.send(digit)
//          }
//          .accessibilityIdentifier(digit.description)
//        }
//      }
//        .toolbar {
//          ToolbarItem(placement: .confirmationAction) {
//            BadgeView(number: viewModel.selectedNum)
//          }
//          ToolbarItem(placement: .principal) {
//            Text(Digits01.description)
//          }
//        }
//    }
//    .onChange(of: isPresented) {
//      guard !isPresented else { return }
//      tasksForLeavingThisView()
//    }
//  }
//  
//  func tasksForLeavingThisView() {
//      settings.state100 = viewModel.output.state100
//  }
//}
//
////#Preview {
////  Digits01Picker(settings: Settings())
////}
