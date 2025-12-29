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
        guard let payload = try? decoder.decode(StopHookPayload.self, from: data) else {
            print("Failed to decode StopHookPayload")
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

        let latestTranscript = TranscriptFileParser.latestAssistantTranscript(from: transcripts)

        let latestTranscriptContent = latestTranscript!.message?.content.first

        let message = TranscriptFileParser.extractContent(from: latestTranscriptContent!)

        try? notifier.notify(
            message: message ?? "",
            title: "Stop - Claude Code",
            soundName: "Glass"
        )
    }
}
