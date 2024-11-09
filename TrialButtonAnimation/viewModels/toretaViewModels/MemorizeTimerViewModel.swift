//
//  MemorizeTimerViewModel.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2024/11/09.
//

import Combine

final class MemorizeTimerViewModel: ViewModelObject {
    final class Input: InputObject {
        /// Play/Pauseボタンのタップイベント
        let playButtonTapped = PassthroughSubject<Void, Never>()
    }
    
    final class Binding: BindingObject { }
    
    final class Output: OutputObject {
        /// Play/Pauseボタンの有効フラグ
        @Published fileprivate(set) var isPlayButtonDisabled = false
    }
    
    let input: Input
    @BindableObject private(set) var binding: Binding
    let output: Output
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        let input = Input()
        let binding = Binding()
        let output = Output()
        
        self.input = input
        self.binding = binding
        self.output = output
        
        
    }
    
//    var objectWillChange: AnyPublisher<Void, Never>
    
    
}
