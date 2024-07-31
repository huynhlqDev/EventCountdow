//
//  EventCell.swift
//  EventCountdown
//
//  Created by huynh on 31/7/24.
//

import SwiftUI

struct EventViewCell: View {
    let event: Event

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(event.title)
                    .font(.title)
                    .bold()
                    .foregroundColor(event.color)
                Text(getRemainTime())
            }
            Spacer()
        }
    }

    private func getRemainTime() -> String {
        let currentDate = Date()
        let calendar = Calendar.current

        let futureDate = Calendar.current.date(
            byAdding: .month,
            value: 3,
            to: Date()
        )!
        let futureDateWithHours = Calendar.current.date(
            byAdding: .hour,
            value: 5,
            to: futureDate
        )!
        let components = calendar.dateComponents(
            [.month, .hour],
            from: currentDate,
            to: futureDateWithHours
        )
        guard
            let months = components.month,
            let hours = components.hour
        else {
            return "End time"
        }

        if months == 1 {
            return "next month"
        } else if months > 0 {
            return "in \(months) months"
        } else if hours > 0 {
            return "\(hours) hours ago"
        } else {
            return "End time"
        }
    }
}

#Preview {
    List {
        EventViewCell(event: Event(title: "Ahihi", date: Date(), color: .blue))
        EventViewCell(event: Event(title: "Ahihi", date: Date(), color: .red))
    }
}
