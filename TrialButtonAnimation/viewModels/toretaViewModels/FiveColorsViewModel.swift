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
  
  init(state100: SelectedState100) {
    let input = Input()
    let binding = Binding()
    let output = Output()
    
    
    
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
