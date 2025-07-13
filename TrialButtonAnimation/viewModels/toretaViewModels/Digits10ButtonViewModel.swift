//
//  Digits10ButtonViewModel.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2025/07/06.
//

// import Combine

final class Digits10ButtonViewModel: DigitsButtonViewModel<Digits10> {}

//final class Digits10ButtonViewModel: ViewModelObject, FillTypeHandlable {
//  
//  final class Input: InputObject {
//    let setFillType = PassthroughSubject<FillType, Never>()
//  }
//  
//  final class Binding: BindingObject {
//  }
//  
//  final class Output: OutputObject {
//    @Published var fillType: FillType = .full
//  }
//  
//  let input: Input
//  @BindableObject private(set) var binding: Binding
//  let output: Output
//  private var cancellables: Set<AnyCancellable> = []
//  
//  let digit: Digits10
//
//  init(digit: Digits10) {
//    let input = Input()
//    let binding = Binding()
//    let output = Output()
//    
//    input.setFillType
//      .assign(to: \.fillType, on: output)
//      .store(in: &cancellables)
//    
//    self.digit = digit
//    self.input = input
//    self.binding = binding
//    self.output = output
//  }
//}
//
//extension Digits10ButtonViewModel {
//  var numbersDescription: String {
//    "歌番号: " +
//    digit.poemNumbers.description
//      .dropFirst()
//      .dropLast()
//  }
//}
