//
//  OsascriptNotifier.swift
//  EduardoKirk
//
//  Created by ohataken on 2025/12/29.
//

import Foundation

final class OsascriptNotifier: DesktopNotificationProtocol {
    func notify(message: String, title: String, soundName: String? = nil) throws {
        let escapedMessage = message.replacingOccurrences(of: "\"", with: "\\\"")
        let escapedTitle = title.replacingOccurrences(of: "\"", with: "\\\"")

        let script: String
        if let soundName = soundName {
            script = "display notification \"\(escapedMessage)\" with title \"\(escapedTitle)\" sound name \"\(soundName)\""
        } else {
            script = "display notification \"\(escapedMessage)\" with title \"\(escapedTitle)\""
        }

        let process = Process()
        process.executableURL = URL(fileURLWithPath: "/usr/bin/osascript")
        process.arguments = ["-e", script]

        try process.run()
        process.waitUntilExit()
    }
}
