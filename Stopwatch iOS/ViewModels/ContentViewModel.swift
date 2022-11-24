//
//  ContentViewModel.swift
//  Stopwatch iOS
//
//  Created by Yurii Samoienko on 24.11.2022.
//

import Foundation
import Combine

class ContentViewModel: ObservableObject { //TODO protocol
    
    private var timerCancelable: AnyCancellable?
    private let dateFormatter = DateFormatter()
    
    private struct ButtonTitle {
        static let start = "Start"
        static let stop = "Stop"
    }
    
    @Published
    var timerText: String = ""
    
    @Published
    var buttonTitle: String = ""
    
    init() {
        dateFormatter.dateFormat = "mm:ss:SS"
        self.resetTimer()
    }
    
    deinit {
        timerCancelable?.cancel()
    }
    
    func toggle() {
        if timerCancelable != nil {
            timerCancelable?.cancel()
            timerCancelable = nil
            buttonTitle = ButtonTitle.stop
        } else {
            resetTimer()
            let start = Date()
            timerCancelable = Timer
                .publish(every: 0.01, on: .main, in: .common)
                .autoconnect()
                .map({ (date) in
                    date.timeIntervalSince(start)
                })
                .sink(receiveValue: { [weak self] time in
                    self?.updateTimerText(time)
                })
        }
    }
    
    private func resetTimer() {
        updateTimerText(0)
        buttonTitle = ButtonTitle.start
    }
    
    private func updateTimerText(_ time: TimeInterval) {
        timerText = dateFormatter.string(from: Date(timeIntervalSince1970: time))
    }
}
