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
            fputs("No input received from stdin", stderr)
            return
        }

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        guard let payload = try? decoder.decode(StopHookPayload.self, from: data) else {
            fputs("Failed to decode StopHookPayload", stderr)
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
            title: "Stop (\(content.type)) - \(payload.cwdURL.lastPathComponent)",
            soundName: "Glass"
        )
    }
}
