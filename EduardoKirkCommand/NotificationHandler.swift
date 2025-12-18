//
//  NotificationHandler.swift
//  EduardoKirk
//
//  Created by ohataken on 2025/12/17.
//

import Foundation

struct NotificationHandler {
    static func doesCommandMatch(_ args: [String]) -> Bool {
        return args.count > 1 && args[1] == "notification"
    }
    
    static func handle(args: [String], stdin: String) {
        guard !stdin.isEmpty, let data = stdin.data(using: .utf8) else {
            print("Failed to decode NotificationHookPayload")
            return
        }

        let decoder = JSONDecoder()
        guard let payload = try? decoder.decode(NotificationHookPayload.self, from: data) else {
            print("Failed to decode NotificationHookPayload")
            return
        }

        guard let fileContent = try? String(contentsOfFile: payload.transcriptPath, encoding: .utf8) else {
            print("Failed to read transcript file")
            return
        }

        var transcripts: [TranscriptPayload] = []
        let lines = fileContent.split(separator: "\n", omittingEmptySubsequences: false).map(String.init)

        for line in lines {
            guard let lineData = line.data(using: .utf8) else {
                continue
            }

            if let transcript = try? decoder.decode(TranscriptPayload.self, from: lineData) {
                transcripts.append(transcript)
            }
        }

        let process = Process()
        process.executableURL = URL(fileURLWithPath: "/usr/bin/osascript")
        process.arguments = ["-e", "display notification \"handleNotification\" with title \"handleNotification\" sound name \"Glass\""]
        try? process.run()
        process.waitUntilExit()
    }
}
