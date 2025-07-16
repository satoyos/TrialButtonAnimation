//
//  Digits10PickerViewModel.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2025/07/06.
//

import Combine

final class Digits10PickerViewModel: ViewModelObject, FillTypeHandlable {
  final class Input: InputObject {
    let digitButtonTapped = PassthroughSubject<Digits10, Never>()
  }
  
  final class Binding: BindingObject {
  }
  
  final class Output: OutputObject {
    @Published var state100: SelectedState100 = .init()
  }
  
  let input: Input
  @BindableObject private(set) var binding: Binding
  let output: Output
  private var cancellables: Set<AnyCancellable> = []
  
  init(state100: SelectedState100) {
    let input = Input()
    let binding = Binding()
    let output = Output()
    
    output.state100 = state100
    
    Digits10.allCases.forEach { digit in
      let fillType = Self.fillType(of: digit, for: state100)
      digit.buttonViewModel.input.setFillType.send(fillType)
    }
    
    input.digitButtonTapped
      .sink { digit in
        let currentFillType = digit.buttonViewModel.output.fillType
        let currentState100 = output.state100
        switch currentFillType {
        case .full:
          output.state100 = currentState100.cancelInNumbers(digit.poemNumbers)
          digit.buttonViewModel.input.setFillType.send(.empty)
        default:
          output.state100 = currentState100.selectInNumbers(digit.poemNumbers)
          digit.buttonViewModel.input.setFillType.send(.full)
        }
      }
      .store(in: &cancellables)
    
    self.input = input
    self.binding = binding
    self.output = output
  }
}

extension Digits10PickerViewModel {
  var selectedNum: Int {
    output.state100.selectedNum
  }
}

extension Digits10PickerViewModel {
  static func fillType(of digit: Digits10,
                       for state100: SelectedState100) -> FillType {
    fillType(of: state100.allSelectedNumbers,
             in: digit.poemNumbers)
  }
}

