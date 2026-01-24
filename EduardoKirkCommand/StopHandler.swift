//
//  StopHandler.swift
//  EduardoKirk
//
//  Created by ohataken on 2025/12/17.
//

import Foundation

struct StopHandler: CommandHandlerProtocol {
    private static let notifier = OsascriptNotifier()

    static func doesCommandMatch(_ args: [String]) -> Bool {
        return args.count > 1 && args[1] == "stop"
    }
    
    static func handle(args: [String], stdin: String) {
        guard !stdin.isEmpty, let data = stdin.data(using: .utf8) else {
            print("Failed to decode StopHookPayload")
            return
        }

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        guard let payload = try? decoder.decode(StopHookPayload.self, from: data) else {
            print("Failed to decode StopHookPayload")
            return
        }

        guard let fileContent = try? String(contentsOfFile: payload.transcriptPath, encoding: .utf8) else {
            print("Failed to read transcript file")
            return
        }

        let lines = fileContent.split(separator: "\n", omittingEmptySubsequences: false).map(String.init)

        let transcripts = lines.compactMap { line -> TranscriptPayload? in
            guard let data = line.data(using: .utf8) else { return nil }
            return try? decoder.decode(TranscriptPayload.self, from: data)
        }

        guard let latestTranscript = TranscriptFileParser.latestAssistantTranscript(from: transcripts),
              let content = latestTranscript.message?.content.first,
              let message = TranscriptFileParser.extractContent(from: content) else {
            return
        }

        try? notifier.notify(
            message: message,
            title: "Stop - Claude Code",
            soundName: "Glass"
        )
    }
}
