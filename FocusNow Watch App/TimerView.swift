//
//  TimerView.swift
//  FocusNow
//
//  Created by malva on 14/01/25.
//
import SwiftUI

struct TimerView: View {
    @ObservedObject var pomodoroTimer: PomodoroTimer
    
    var body: some View {
        VStack(spacing: 10) {
            Text(timeString(from: pomodoroTimer.timeRemaining))
                .font(.system(size: 40, weight: .bold, design: .rounded))
                .foregroundColor(pomodoroTimer.isBreak ? .green : .white)
            
            HStack(spacing: 20) {
                Button(action: {
                    if pomodoroTimer.isRunning {
                        pomodoroTimer.pauseTimer()
                    } else {
                        pomodoroTimer.startTimer()
                    }
                }) {
                    Image(systemName: pomodoroTimer.isRunning ? "pause.fill" : "play.fill")
                        .font(.title2)
                }
                
                Button(action: {
                    pomodoroTimer.resetTimer()
                }) {
                    Image(systemName: "arrow.clockwise")
                        .font(.title2)
                }
            }
        }
        .padding()
    }
    
    private func timeString(from seconds: Int) -> String {
        let minutes = seconds / 60
        let remainingSeconds = seconds % 60
        return String(format: "%02d:%02d", minutes, remainingSeconds)
    }
}
