//
//  EventDetailView.swift
//  EventCountdown
//
//  Created by huynh on 31/7/24.
//

import SwiftUI

struct EditEventView: View {

    let event: Event

    var body: some View {
        Text("Hello, World!")
            .navigationTitle(event.title)
    }
}

#Preview {
    EditEventView(event: Event(title: "event", date: Date(), color: .blue))
}
