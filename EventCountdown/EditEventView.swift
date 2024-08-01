//
//  EventDetailView.swift
//  EventCountdown
//
//  Created by huynh on 31/7/24.
//

import SwiftUI

struct EditEventView: View {

    @Environment(\.dismiss) var dismiss

    let event: Event
    @State private var title: String = ""

    var body: some View {
        List {
            TextField("Title", text: $title)
                .padding()
                .cornerRadius(8)
                .keyboardType(.default)

            Text("Date").padding()

            Text("Text Color").padding()
        }

            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(event.title)
                        .font(.headline)
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button(
                        action: {
                            EventsManager.shared.updateEvent(newValue: event)
                            dismiss()
                        }, label: {
                            Image(systemName: "checkmark")
                        }
                    )
                }
            }
    }
}

#Preview {
    NavigationStack {
        EditEventView(event: Event(title: "Add event", date: Date(), color: .green))
    }
}
