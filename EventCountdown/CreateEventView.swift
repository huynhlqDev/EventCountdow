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

    @State private var pickerPosition: CGRect = .zero

    var body: some View {
        ZStack (alignment: .top) {List {
            // add title
            TextField(
                "Title",
                text: $title,
                onEditingChanged: { _ in
                    toggleState(.titleEditing)
                }
            )
            .foregroundStyle(color)
            .cornerRadius(8)
            .keyboardType(.default)
            .frame(height: 30)

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
                            .background(Color(UIColor.systemGray5))
                            .cornerRadius(8)
                    }
                ).buttonStyle(PlainButtonStyle())
                    .background {
                        GeometryReader { geo in
                            Color.clear
                                .onAppear {
                                    print(geo.frame(in: .global))
                                    pickerPosition = geo.frame(in: .global)
                                }
                        }
                    }

                Button(
                    action: {
                        toggleState(.showTimePicker)
                    },
                    label: {
                        Text(date.formattedDateWithTime())
                            .padding()
                            .background(Color(UIColor.systemGray5))
                            .cornerRadius(8)
                    }
                )
                .buttonStyle(PlainButtonStyle())

            }
            .frame(height: 50)

            // add color
            ColorPicker("Text Color", selection: $color)
                .frame(height: 30)
        }
        .scrollDisabled(true)


            // Display DatePicker based on the state
            if viewState == .showDatePicker {
                VStack {
                    Spacer()
                    DatePicker(
                        "Date event",
                        selection: $date,
                        displayedComponents: [.date]
                    )
                    .datePickerStyle(.graphical)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
                    .padding(.horizontal)
                    .frame(height: 300)
                }
                .frame(width: UIScreen.main.bounds.width, height: 300)
                .offset(y: pickerPosition.maxY - (pickerPosition.height * 3/2))
            } else if viewState == .showTimePicker {
                VStack {
                    Spacer()
                    DatePicker(
                        "Date event",
                        selection: $date,
                        displayedComponents: [.hourAndMinute]
                    )
                    .datePickerStyle(.wheel)
                    .labelsHidden()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
                    .frame(height: 200)
                }
                .frame(width: UIScreen.main.bounds.width, height: 200)
                .offset(y: pickerPosition.maxY - (pickerPosition.height * 3/2))
            }
        }

        // config navigator
        .navigationBarTitle("Add Event", displayMode: .inline)
        .toolbar {
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

    private func endEditing() {
        UIApplication.shared.endEditing()
    }
}

#Preview {
    NavigationStack {
        CreateEventView()
    }
}
