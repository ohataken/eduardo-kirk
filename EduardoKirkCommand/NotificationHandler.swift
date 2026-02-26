//
//  NotificationHandler.swift
//  EduardoKirk
//
//  Created by ohataken on 2025/12/17.
//

import Foundation

struct NotificationHandler: CommandHandlerProtocol {
    private static let notifier = OsascriptNotifier()

    static func doesCommandMatch(_ args: [String]) -> Bool {
        return args.count > 1 && args[1] == "notification"
    }
    
    static func handle(args: [String], stdin: String) {
        guard !stdin.isEmpty, let data = stdin.data(using: .utf8) else {
            fputs("No input received from stdin", stderr)
            return
        }

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        guard let payload = try? decoder.decode(NotificationHookPayload.self, from: data) else {
            fputs("Failed to decode NotificationHookPayload", stderr)
            return
        }

        guard let fileContent = try? String(contentsOfFile: payload.transcriptPath, encoding: .utf8) else {
            fputs("Failed to read transcript file", stderr)
            return
        }

        let lines = fileContent.split(separator: "\n", omittingEmptySubsequences: false).map(String.init)

        let transcripts = lines.compactMap { line in
            try? decoder.decode(TranscriptPayload.self, from: Data(line.utf8))
        }
        
        guard let latestTranscript = TranscriptFileParser.latestAssistantTranscript(from: transcripts),
              let content = latestTranscript.message?.content.first else {
            fputs("No assistant message found in transcript", stderr)
            return
        }

        let message = TranscriptFileParser.extractContent(from: content)

        try? notifier.notify(
            message: message,
            title: "Notification (\(content.type)) - \(payload.cwdURL.lastPathComponent)",
            soundName: content.soundName
        )
    }
}
