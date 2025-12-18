//
//  StopHandler.swift
//  EduardoKirk
//
//  Created by ohataken on 2025/12/16.
//

import UserNotifications

struct StopHandler {
    static func doesCommandMatch(_ args: [String]) -> Bool {
        return args.count > 1 && args[1] == "stop"
    }
    
    static func handle(args: [String], stdin: String) async {
        guard !stdin.isEmpty, let data = stdin.data(using: .utf8) else {
            print("Failed to decode StopHookPayload")
            return
        }

        let decoder = JSONDecoder()
        guard let payload = try? decoder.decode(StopHookPayload.self, from: data) else {
            print("Failed to decode StopHookPayload")
            return
        }

        let granted = await withCheckedContinuation { continuation in
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, _ in
                continuation.resume(returning: granted)
            }
        }

        if granted {
            let content = UNMutableNotificationContent()
            content.title = "stop"

            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

            await withCheckedContinuation { continuation in
                UNUserNotificationCenter.current().add(request) { error in
                    if let error = error {
                        print("Error scheduling notification: \(error)")
                    }
                    continuation.resume()
                }
            }
        }
    }
}
