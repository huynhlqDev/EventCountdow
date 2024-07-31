//
//  ContentView.swift
//  EventCountdown
//
//  Created by huynh on 31/7/24.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject private var eventsManager = EventsManager.shared
    var body: some View {
        NavigationSplitView {
            EventsSidebarView(events: eventsManager.readEvents())
        } detail: {
            ContentUnavailableView("No event selected", systemImage: "swatchpalette")
        }
    }
}

#Preview {
    ContentView()
}
