//
//  CommandHandler.swift
//  EduardoKirk
//
//  Created by ohataken on 2025/12/16.
//

import UserNotifications

struct CommandHandler {
    private static func isSessionStart(_ args: [String]) -> Bool {
        return args.count > 1 && args[1] == "session-start"
    }

    private static func isSessionEnd(_ args: [String]) -> Bool {
        return args.count > 1 && args[1] == "session-end"
    }
    
    private static func isUserPromptSubmit(_ args: [String]) -> Bool {
        return args.count > 1 && args[1] == "user-prompt-submit"
    }

    private static func isNotification(_ args: [String]) -> Bool {
        return args.count > 1 && args[1] == "notification"
    }

    private static func isStop(_ args: [String]) -> Bool {
        return args.count > 1 && args[1] == "stop"
    }
    
    private static func handleSessionStart(args: [String], stdin: String) async {
        let granted = await withCheckedContinuation { continuation in
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, _ in
                continuation.resume(returning: granted)
            }
        }

        if granted {
            let content = UNMutableNotificationContent()
            content.title = "session-start"

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

    private static func handleSessionEnd(args: [String], stdin: String) async {
        let granted = await withCheckedContinuation { continuation in
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, _ in
                continuation.resume(returning: granted)
            }
        }

        if granted {
            let content = UNMutableNotificationContent()
            content.title = "session-end"

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

    private static func handleNotification(args: [String], stdin: String) async {
        let granted = await withCheckedContinuation { continuation in
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, _ in
                continuation.resume(returning: granted)
            }
        }

        if granted {
            let content = UNMutableNotificationContent()
            content.title = "notification"

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

    private static func handleStop(args: [String], stdin: String) async {
    }

    private static func handleUserPromptSubmit(args: [String], stdin: String) async {
    }
}
