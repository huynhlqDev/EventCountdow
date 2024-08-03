//
//  CreateEventView.swift
//  EventCountdown
//
//  Created by huynh on 31/7/24.
//

import SwiftUI

struct CreateEventView: View {
    enum ViewState {
        case normal
        case titleEditing
        case showDatePicker
        case showTimePicker
        case presentColorView
    }

    @Environment(\.dismiss) var dismiss
    @State private var title: String = ""
    @State private var date: Date = Date()
    @State private var color: Color = .purple

    @State private var viewState: ViewState = .normal

    var body: some View {
        List {
            // add title
            TextField(
                "Title",
                text: $title,
                onEditingChanged: { _ in
                    toggleState(.titleEditing)
                }
            )
            .cornerRadius(8)
            .keyboardType(.default)

            // add date time
            HStack {
                Text("Date")
                    .padding(.vertical)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Spacer()

                Button(
                    action: {
                        toggleState(.showDatePicker)
                    },
                    label: {
                        Text(date.formattedDate())
                            .padding()
                            .background(Color.gray)
                            .cornerRadius(8)
                            .foregroundStyle(.black)
                    }
                ).buttonStyle(PlainButtonStyle())

                Button(
                    action: {
                        toggleState(.showTimePicker)
                    },
                    label: {
                        Text(date.formattedDateWithTime())
                            .padding()
                            .background(Color.gray)
                            .cornerRadius(8)
                            .foregroundStyle(.black)
                    }
                ).buttonStyle(PlainButtonStyle())
            }
            if viewState == .showDatePicker {
                DatePicker(
                    "Date event",
                    selection: $date,
                    displayedComponents: [.date]
                )
                .datePickerStyle(.graphical)
            } else if viewState == .showTimePicker {
                DatePicker(
                    "Date event",
                    selection: $date,
                    displayedComponents: [.hourAndMinute]
                )
                .datePickerStyle(.wheel)
            }

            // add color
            Text("Text Color")
        }

        // config navigator
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Add Event")
                    .font(.headline)
            }

            ToolbarItem(placement: .topBarTrailing) {
                Button(
                    action: {
                        EventsManager.shared.createEvent(
                            title: title,
                            date: date,
                            color: color
                        )
                        dismiss()
                    }, label: {
                        Image(systemName: "checkmark")
                    }
                )
            }
        }
    }

    private func toggleState(_ state: ViewState) {
        if viewState == state {
            viewState = .normal
        } else {
            viewState = state
        }
    }

    private func hideKeyboard() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder), 
            to: nil, from: nil, for: nil
        )
    }
}

#Preview {
    NavigationStack {
        CreateEventView()
    }
}
