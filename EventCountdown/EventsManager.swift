//
//  EventsManager.swift
//  EventCountdown
//
//  Created by huynh on 31/7/24.
//

import Foundation
import SwiftUI

struct Event: Identifiable {
    let id: UUID
    var title: String
    var date: Date
    var color: Color

    init(title: String, date: Date, color: Color) {
        self.id = UUID()
        self.title = title
        self.date = date
        self.color = color
    }
}

final class EventsManager: ObservableObject {
    static let shared = EventsManager()

    @Published private var events: [Event] = [
        Event(title: "Halloween", date: Date(), color: .orange),
        Event(title: "Christmas", date: Date(), color: .green),
        Event(title: "New Year's Eve", date: Date(), color: .yellow),
        Event(title: "King's Day", date: Date(), color: .red),
        Event(title: "Independency Day", date: Date(), color: .blue),
    ]

    // create event
    func createEvent(title: String, date: Date, color: Color) {
        let newEvent = Event(title: title, date: date, color: color)
        events.append(newEvent)
    }

    // get events
    func readEvents() -> [Event] {
        return events
    }

    // update event
    func updateEvent(newValue: Event) {
        if let index = events.firstIndex(where: { $0.id == newValue.id }) {
            events[index].title = newValue.title
            events[index].date = newValue.date
            events[index].color = newValue.color
        }
    }

    // delete event
    func deleteEvent(id: UUID) {
        if let index = events.firstIndex(where: { $0.id == id }) {
            events.remove(at: index)
        }
    }
}
