//
//  Digits01PickerViewModel.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2025/06/22.
//

import Combine

final class Digits01PickerViewModel: ViewModelObject, FillTypeHandlable {
  final class Input: InputObject {
    let digitButtonTapped = PassthroughSubject<Digits01, Never>()
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
    
    Digits01.allCases.forEach { digit01 in
      let fillType = Self.fillType(of: digit01, for: state100)
      digit01.buttonViewModel.input.setFillType.send(fillType)
    }
    
    input.digitButtonTapped
      .sink { digit in
        let currentFillType = digit.buttonViewModel.output.fillType
        let currentState100 = output.state100
        switch currentFillType {
        case .full:
          output.state100 = currentState100.cancelInNumbers(digit.pormNumbers)
          digit.buttonViewModel.input.setFillType.send(.empty)
        default:
          output.state100 = currentState100.selectInNumbers(digit.pormNumbers)
          digit.buttonViewModel.input.setFillType.send(.full)
        }
      }
      .store(in: &cancellables)
    
    self.input = input
    self.binding = binding
    self.output = output
  }
}

extension Digits01PickerViewModel {
  var selectedNum: Int {
    output.state100.selectedNum
  }
}

extension Digits01PickerViewModel {
  static func fillType(of digts01: Digits01,
                       for state100: SelectedState100) -> FillType {
    fillType(of: state100.allSelectedNumbers,
             in: digts01.pormNumbers)
  }
}

fileprivate let oneButtonViewModel = Digits01ButtonViewModel(digit01: .one)
fileprivate let twoButtonViewModel = Digits01ButtonViewModel(digit01: .two)
fileprivate let threeButtonViewModel = Digits01ButtonViewModel(digit01: .three)
fileprivate let foourButtonViewModel = Digits01ButtonViewModel(digit01: .four)
fileprivate let fiveButtonViewModel = Digits01ButtonViewModel(digit01: .five)
fileprivate let sixButtonViewModel = Digits01ButtonViewModel(digit01: .six)
fileprivate let sevenButtonViewModel = Digits01ButtonViewModel(digit01: .seven)
fileprivate let eightButtonViewModel = Digits01ButtonViewModel(digit01: .eight)
fileprivate let nineButtonViewModel = Digits01ButtonViewModel(digit01: .nine)
fileprivate let zeroButtonViewModel = Digits01ButtonViewModel(digit01: .zero)

extension Digits01 {
  var buttonViewModel: Digits01ButtonViewModel {
    switch self {
    case .one:   oneButtonViewModel
    case .two:   twoButtonViewModel
    case .three: threeButtonViewModel
    case .four:  foourButtonViewModel
    case .five:  fiveButtonViewModel
    case .six:   sixButtonViewModel
    case .seven: sevenButtonViewModel
    case .eight: eightButtonViewModel
    case .nine:  nineButtonViewModel
    case .zero:  zeroButtonViewModel
    }
  }
}
