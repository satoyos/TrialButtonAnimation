//
//  Digits01ButtonViewModel.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2025/06/21.
//

import Combine

final class Digits01ButtonViewModel: ViewModelObject {
  final class Input: InputObject {
    let setFillType = PassthroughSubject<FillType, Never>()
  }
  
  final class Binding: BindingObject {
  }
  
  final class Output: OutputObject {
    @Published var fillType: FillType = .full
  }
  
  let input: Input
  @BindableObject private(set) var binding: Binding
  let output: Output
  
  let digit: Digits01
  private var cancellables: Set<AnyCancellable> = []
  
  init(digit: Digits01) {
    let input = Input()
    let binding = Binding()
    let output = Output()
    
    output.fillType = .full
    
    input.setFillType
      .assign(to: \.fillType, on: output)
      .store(in: &cancellables)
    
    self.digit = digit
    self.input = input
    self.binding = binding
    self.output = output
  }
}

extension Digits01ButtonViewModel {
  var numbersDescription: String {
    "歌番号: " +
    digit.poemNumbers.description
      .dropFirst()
      .dropLast()
  }
}
