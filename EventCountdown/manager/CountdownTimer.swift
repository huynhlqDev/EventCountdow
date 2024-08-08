//
//  CountdownTimer.swift
//  EventCountdown
//
//  Created by huynh on 8/8/24.
//

import SwiftUI
import Combine

class CountdownTimer: ObservableObject {
    @Published var remainingTime: String = ""
    private var targetDate: Date
    private var timer: AnyCancellable?

    init(targetDate: Date) {
        self.targetDate = targetDate
        startTimer()
    }

    func startTimer() {
        timer = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.updateRemainingTime()
            }
    }

    private func updateRemainingTime() {
        let now = Date()
        if now >= targetDate {
            remainingTime = "Event has started"
            timer?.cancel()
        } else {
            let formatter = RelativeDateTimeFormatter()
            formatter.unitsStyle = .full
            remainingTime = formatter.localizedString(for: targetDate, relativeTo: now)
        }
    }
}
