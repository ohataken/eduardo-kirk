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
        guard !stdin.isEmpty, let data = stdin.data(using: .utf8) else {
            print("Failed to decode SessionStartHookPayload")
            return
        }

        let decoder = JSONDecoder()
        guard let payload = try? decoder.decode(SessionStartHookPayload.self, from: data) else {
            print("Failed to decode SessionStartHookPayload")
            return
        }

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
        guard !stdin.isEmpty, let data = stdin.data(using: .utf8) else {
            print("Failed to decode SessionEndHookPayload")
            return
        }

        let decoder = JSONDecoder()
        guard let payload = try? decoder.decode(SessionEndHookPayload.self, from: data) else {
            print("Failed to decode SessionEndHookPayload")
            return
        }

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
        guard !stdin.isEmpty, let data = stdin.data(using: .utf8) else {
            print("Failed to decode NotificationHookPayload")
            return
        }

        let decoder = JSONDecoder()
        guard let payload = try? decoder.decode(NotificationHookPayload.self, from: data) else {
            print("Failed to decode NotificationHookPayload")
            return
        }

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

    private static func handleUserPromptSubmit(args: [String], stdin: String) async {
        guard !stdin.isEmpty, let data = stdin.data(using: .utf8) else {
            print("Failed to decode UserPromptSubmitHookPayload")
            return
        }

        let decoder = JSONDecoder()
        guard let payload = try? decoder.decode(UserPromptSubmitHookPayload.self, from: data) else {
            print("Failed to decode UserPromptSubmitHookPayload")
            return
        }

        let granted = await withCheckedContinuation { continuation in
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, _ in
                continuation.resume(returning: granted)
            }
        }

        if granted {
            let content = UNMutableNotificationContent()
            content.title = "user-prompt-submit"

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

    static func handle(_ args: [String]) async {
        let data = FileHandle.standardInput.readDataToEndOfFile()
        let stdin = String(data: data, encoding: .utf8) ?? ""

        if isSessionStart(args) {
            await handleSessionStart(args: args, stdin: stdin)
        } else if isSessionEnd(args) {
            await handleSessionEnd(args: args, stdin: stdin)
        } else if isNotification(args) {
            await handleNotification(args: args, stdin: stdin)
        } else if isStop(args) {
            await handleStop(args: args, stdin: stdin)
        } else if isUserPromptSubmit(args) {
            await handleUserPromptSubmit(args: args, stdin: stdin)
        } else {
            print("Unknown command")
        }
    }
}
