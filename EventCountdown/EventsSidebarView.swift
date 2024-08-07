//
//  EventsSidebarView.swift
//  EventCountdown
//
//  Created by huynh on 31/7/24.
//

import SwiftUI

struct EventsSidebarView: View {
    @State private var path = NavigationPath()
    var events: [Event]

    var body: some View {
        NavigationStack {
            List(events) { event in
                NavigationLink(value: event) {
                    EventViewCell(event: event)
                    .swipeActions() {
                        Button(role: .destructive) {
                            EventsManager.shared.deleteEvent(id: event.id)
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                }
                .navigationTitle("Events")
                .navigationDestination(for: Event.self) { event in
                    EventInfoView(event: event)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(value: "addNew") {
                        Image(systemName: "plus")
                    }
                    .navigationDestination(for: String.self) { value in
                        switch value {
                        case "addNew":
                            EventInfoView()
                        default:
                            EmptyView()
                        }
                    }
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
