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
        
    }
    
    final class Binding: BindingObject {
        @Published var volume: Double = 0.0
    }
    
    let input: Input
    @BindableObject private(set) var binding: Binding
    let output: Output
    
    init(volume: Double) {
        let input = Input()
        let binding = Binding()
        let output = Output()
        
        binding.volume = volume
        
        self.input = input
        self.binding = binding
        self.output = output
    }
}
