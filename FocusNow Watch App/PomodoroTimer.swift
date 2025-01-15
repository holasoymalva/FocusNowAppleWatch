//
//  PomodoroTimer.swift
//  FocusNow
//
//  Created by malva on 14/01/25.
//

import Foundation
import WatchKit

class PomodoroTimer: ObservableObject {
    @Published var timeRemaining: Int = 25 * 60 // 25 minutes in seconds
    @Published var isRunning: Bool = false
    @Published var isBreak: Bool = false
    
    private var timer: Timer?
    private let workDuration: Int = 25 * 60
    private let breakDuration: Int = 5 * 60
    
    func startTimer() {
        isRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                self.completeSession()
            }
        }
    }
    
    func pauseTimer() {
        isRunning = false
        timer?.invalidate()
        timer = nil
    }
    
    func resetTimer() {
        pauseTimer()
        timeRemaining = isBreak ? breakDuration : workDuration
    }
    
    private func completeSession() {
        pauseTimer()
        WKInterfaceDevice.current().play(.notification)
        isBreak.toggle()
        timeRemaining = isBreak ? breakDuration : workDuration
    }
}
