//
//  VolumeSettingViewModel.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2025/01/18.
//

import Combine

final class VolumeSettingViewModel: ViewModelObject {
  final class Input: InputObject {
  }
  
  final class Output: OutputObject {
    @Published var ratioText = "0"
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
//    output.ratioText = Self.percentStrOf(ratio: volume)
    
    binding.$volume
      .map { Self.percentStrOf(ratio: $0) }
      .assign(to: \.ratioText, on: output)
      .store(in: &cancellables)
    
    self.input = input
    self.binding = binding
    self.output = output
  }
  
  private static func percentStrOf(ratio: Double) -> String {
      String(format: "% 3d", Int(ratio * 100))
  }
}
