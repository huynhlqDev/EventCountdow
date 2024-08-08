//
//  EventCell.swift
//  EventCountdown
//
//  Created by huynh on 31/7/24.
//

import SwiftUI

struct EventViewCell: View {
    @ObservedObject var countdownTimer: CountdownTimer
    let event: Event

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(event.title)
                    .font(.title)
                    .bold()
                    .foregroundColor(event.textColor)
                Text(countdownTimer.remainingTime)
            }
            Spacer()
        }
    }
}

#Preview {
    List {
        EventViewCell(
            countdownTimer: CountdownTimer(targetDate: Date()),
            event: Event(title: "Ahihi", date: Date(), textColor: .blue)
        )
        EventViewCell(
            countdownTimer: CountdownTimer(targetDate: Date()),
            event: Event(title: "Ahihi", date: Date(), textColor: .blue)
        )
    }
}
