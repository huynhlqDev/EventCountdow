//
//  EventCountdownApp.swift
//  EventCountdown
//
//  Created by huynh on 31/7/24.
//

import SwiftUI

@main
struct EventCountdownApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

extension Date {
    func formattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        return formatter.string(from: self)
    }

    func formattedDateWithTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        return formatter.string(from: self)
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
