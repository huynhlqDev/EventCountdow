//
//  EventCell.swift
//  EventCountdown
//
//  Created by huynh on 31/7/24.
//

import SwiftUI

struct EventViewCell: View {
    @State private var now = Date.now
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    let event: Event

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(event.title)
                    .font(.title)
                    .bold()
                    .foregroundColor(event.textColor)
                Text(dateDescription(for: event.date, relativeTo: now)) .onReceive(timer) { current in
                    now = current
                }
            }
            Spacer()
        }
    }
    private func dateDescription(for date: Date, relativeTo anotherDate: Date) -> String {
        let format = RelativeDateTimeFormatter()
        format.unitsStyle = .full
        format.dateTimeStyle = .named
        return format.localizedString(for: date, relativeTo: anotherDate)

    }
}

#Preview {
    List {
        EventViewCell(
            event: Event(title: "Ahihi", date: Date(), textColor: .blue)
        )
        EventViewCell(
            event: Event(title: "Ahihi", date: Date(), textColor: .blue)
        )
    }
}
