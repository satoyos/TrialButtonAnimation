//
//  FiveColorsViewModel.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2025/04/19.
//

import Combine

final class FiveColorsViewModel: ViewModelObject, FillTypeHandlable {

  

  final class Input: InputObject {
    let colorButtonTapped = PassthroughSubject<FiveColors, Never>()
    let selectJust20OfColor = PassthroughSubject<FiveColors, Never>()
      
  }
  
  final class Binding: BindingObject {
  }
  
  final class Output: OutputObject {
    @Published var state100: SelectedState100 = .init()
  }
  
  let input: Input
  @BindableObject private(set) var binding:  Binding
  let output: Output
  private let state100: SelectedState100
  var cancellables: Set<AnyCancellable> = []
  
  init(state100: SelectedState100) {
    let input = Input()
    let binding = Binding()
    let output = Output()
    
    input.selectJust20OfColor
      .sink{ color in
        let newState100 = SelectedState100()
          .cancelAll()
          .selectInNumbers(color.poemNumbers)
        output.state100 = newState100
      }
      .store(in: &cancellables)
    
    self.input = input
    self.binding = binding
    self.output = output
    self.state100 = state100
  }
}

extension FiveColorsViewModel {
  func fillType(of color: FiveColors) -> FillType {
    fillType(of: state100.allSelectedNumbers,
             in: color.poemNumbers)
  }
}
