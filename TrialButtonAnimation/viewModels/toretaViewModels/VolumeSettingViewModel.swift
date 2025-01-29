//
//  VolumeSettingViewModel.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2025/01/18.
//

import Combine

final class VolumeSettingViewModel: ViewModelObject {
  final class Input: InputObject {
    let startTestRecitingRequest = PassthroughSubject<Void, Never>()
  }
  
  final class Output: OutputObject {
    @Published fileprivate(set) var ratioText = "0"
    @Published fileprivate(set) var isButtonDisabled = false
  }
  
  final class Binding: BindingObject {
    @Published var volume: Double = 0.0
  }
  
  let input: Input
  @BindableObject private(set) var binding: Binding
  let output: Output
  
  private var cancellables: Set<AnyCancellable> = []
  
  init(volume: Double) {
    let input = Input()
    let binding = Binding()
    let output = Output()
    
    binding.volume = volume
    
    binding.$volume
      .map { Self.percentStrOf(ratio: $0) }
      .assign(to: \.ratioText, on: output)
      .store(in: &cancellables)
    
    input.startTestRecitingRequest
      .sink { _ in
        output.isButtonDisabled = true
      }
      .store(in: &cancellables)
    
    self.input = input
    self.binding = binding
    self.output = output
  }
  
  private static func percentStrOf(ratio: Double) -> String {
      String(format: "% 3d", Int(ratio * 100))
  }
}
