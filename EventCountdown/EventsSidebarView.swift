//
//  EventsSidebarView.swift
//  EventCountdown
//
//  Created by huynh on 31/7/24.
//

import SwiftUI

struct EventsSidebarView: View {
    var events: [Event]

    var body: some View {
        List(events) { event in
            NavigationLink(destination: EditEventView(event: event)) {
                EventViewCell(event: event)
            }
        }
        .navigationTitle("Events")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: CreateEventView()) {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        EventsSidebarView(events: EventsManager.shared.readEvents())
    }
}
