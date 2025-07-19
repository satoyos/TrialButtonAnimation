////
////  Digits10Picker.swift
////  TrialButtonAnimation
////
////  Created by Yoshifumi Sato on 2025/07/06.
////
//
//import SwiftUI
//
//struct Digits10Picker {
//  let settings: Settings
//  @ObservedObject private var viewModel: DigitsPickerViewModel<Digits10>
//  @Environment(\.isPresented) var isPresented
//  
//  init(settings: Settings) {
//    self.settings = settings
//    self.viewModel = .init(state100: settings.state100)
//  }
//}
//
//extension Digits10Picker: View {
//  var body: some View {
//    NavigationStack {
//      List {
//        ForEach(Digits10.allCases) { digit in
//          DigitsButton<Digits10>(viewModel: digit.buttonViewModel) {
//            viewModel.input.digitButtonTapped.send(digit)
//          }
//          .accessibilityIdentifier(digit.description)
//        }
//      }
//      .toolbar {
//        ToolbarItem(placement: .confirmationAction) {
//          BadgeView(number: viewModel.selectedNum)
//        }
//        ToolbarItem(placement: .principal) {
//          Text(Digits10.description)
//        }
//      }
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
//#Preview {
//  Digits10Picker(settings: Settings())
//}
