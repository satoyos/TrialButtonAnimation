//
//  DurationSettingViewModel.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2024/11/12.
//

import Combine

final class DurationSettingViewModel: ViewModelObject {
    final class Input: InputObject {
        
    }
    
    final class Binding: BindingObject {
        
    }
    
    final class Output: OutputObject {
        @Published var secText: String = ""
    }
    
    let input: Input
    @BindableObject private(set) var binding: Binding
    let output: Output
    private var timeViewModel: Sec2FViewModel
    
    private var cancellables: Set<AnyCancellable> = []
    
    init(startTime: Double) {
        let input = Input()
        let binding = Binding()
        let output = Output()
        let timeViewModel = Sec2FViewModel(startTime: startTime, interval: 0.02)
        
        timeViewModel.output.$secText
            .assign(to: \.secText, on: output)
            .store(in: &cancellables)
        
        self.input = input
        self.binding = binding
        self.output = output
        self.timeViewModel = timeViewModel

    }
    

}
