//
//  CreateEventView.swift
//  EventCountdown
//
//  Created by huynh on 31/7/24.
//

import SwiftUI

struct CreateEventView: View {
    enum DatePickerStyle {
        case graphical
        case wheel
    }

    @Environment(\.dismiss) var dismiss
    @State private var title: String = ""
    @State private var date: Date = Date()
    @State private var color: Color = .purple

    @State private var showPopover = false

    var body: some View {
        List {

            // add title
            TextField("Title", text: $title)
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
                        print("showPopover.toggle()")
                        showPopover.toggle()
                    },
                    label: {
                        Text(date.formattedDate())
                            .padding()
                            .background(Color.gray)
                            .cornerRadius(8)
                            .foregroundStyle(.black)
                    }
                )

//                .popover(isPresented: $showPopover, content: {
//                    DatePicker(
//                        "Date event",
//                        selection: $date,
//                        displayedComponents: [.date]
//                    )
//                    .datePickerStyle(.graphical)
//                    .padding()
//                    .frame(width: 100, height: 200)
//                })

                Button(
                    action: {
                        showPopover.toggle()
                    },
                    label: {
                        Text(date.formattedDateWithTime())
                            .padding()
                            .background(Color.gray)
                            .cornerRadius(8)
                            .foregroundStyle(.black)
                    })
            }

            // add color
            Text("Text Color")
        }
        .onTapGesture {
            hideKeyboard()
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

    private func hideKeyboard() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil
        )
    }
}

#Preview {
    NavigationStack {
        CreateEventView()
    }
}
