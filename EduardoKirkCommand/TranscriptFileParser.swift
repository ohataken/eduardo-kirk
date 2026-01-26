//
//  TranscriptFileParser.swift
//  EduardoKirk
//
//  Created by ohataken on 2025/12/17.
//

import Foundation

struct TranscriptFileParser {
    static func latestAssistantTranscript(from payloads: [TranscriptPayload]) -> TranscriptPayload? {
        return payloads
            .filter { $0.timestamp != nil }
            .filter { $0.type == "assistant" || $0.type == "user" }
            .max { a, b in
                a.timestamp! < b.timestamp!
            }
    }

    static func extractContent(from contentPayload: TranscriptMessageContentPayload) -> String {
        switch contentPayload.type {
        case "tool_use", "tool_result":
            return contentPayload.content ?? contentPayload.type
        case "thinking":
            return contentPayload.thinking ?? contentPayload.type
        case "text":
            return contentPayload.text ?? contentPayload.type
        default:
            return contentPayload.type
        }
    }
}
