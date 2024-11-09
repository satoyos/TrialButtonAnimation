//
//  Sec2FViewModel.swift
//  TrialButtonAnimation
//
//  Created by Yoshifumi Sato on 2024/11/09.
//

import Combine

final class Sec2FViewModel: ViewModelObject {
    
    final class Input: InputObject {
        @Published private(set) var startTimerRequest = PassthroughSubject<Void, Never>()
        
        @Published private(set) var stopTimerRequest = PassthroughSubject<Void, Never>()
    }
    
    final class Binding: BindingObject { }
    
    final class Output: OutputObject {
        @Published fileprivate(set) var secText = ""
        
        @Published private(set) var isTimerRunning = false
    }
    
    let input: Input
    @BindableObject private(set) var binding: Binding
    let output: Output
//    private(set) var startTime: Double
//    private let interval: Double
    private var timer: CountDownTimer
    
    private var cancellables = Set<AnyCancellable>()
    
    init(startTime: Double, interval: Double) {
        let input = Input()
        let binding = Binding()
        let output = Output()
        let timer = CountDownTimer(startTime: startTime, intarval: interval)
        output.secText = Self.strOf(time: startTime)
        
        self.input = input
        self.binding = binding
        self.output = output
        self.timer = timer
//        self.startTime = startTime
//        self.interval = interval
        
        
    }
    
    private static func strOf(time: Double) -> String {
        String(format: "%.2F", time)
    }
    
}
