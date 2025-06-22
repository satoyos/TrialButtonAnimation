//
//  Digits01PickerViewModel.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2025/06/22.
//

import Combine

final class Digits01PickerViewModel: ViewModelObject {
  final class Input: InputObject {
    let setFillType = PassthroughSubject<FillType, Never>()
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
    
    self.input = input
    self.binding = binding
    self.output = output
  }
}
