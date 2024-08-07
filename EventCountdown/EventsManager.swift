//
//  EventsManager.swift
//  EventCountdown
//
//  Created by huynh on 31/7/24.
//

import Foundation
import SwiftUI

struct Event: Identifiable, Comparable, Hashable {
    let id: UUID
    var title: String
    var date: Date
    var textColor: Color

    init(id: UUID = UUID(), title: String, date: Date, textColor: Color = .black) {
        self.id = id
        self.title = title
        self.date = date
        self.textColor = textColor
    }

    static func < (lhs: Event, rhs: Event) -> Bool {
        return lhs.date < rhs.date
    }
}

final class EventsManager: ObservableObject {
    static let shared = EventsManager()

    @Published private var events: [Event] = [
        Event(title: "Halloween", date: Date(), textColor: .orange),
        Event(title: "Christmas", date: Date(), textColor: .green),
        Event(title: "New Year's Eve", date: Date(), textColor: .yellow),
        Event(title: "King's Day", date: Date(), textColor: .red),
        Event(title: "Independency Day", date: Date(), textColor: .blue),
    ]

    // create event
    func createEvent(_ newEvent: Event) {
        events.append(newEvent)
    }

    // get events
    func readEvents() -> [Event] {
        return events
    }

    // update event
    func updateEvent(_ newEvent: Event) {
        guard let index = events.firstIndex(where: { $0.id == newEvent.id }) else { return }
        events[index] = newEvent
    }

    // delete event
    func deleteEvent(id: UUID) {
        if let index = events.firstIndex(where: { $0.id == id }) {
            events.remove(at: index)
        }
    }
}
