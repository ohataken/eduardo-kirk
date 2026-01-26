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
            .filter { $0.type == "assistant" }
            .max { a, b in
                a.timestamp! < b.timestamp!
            }
    }

    static func extractContent(from contentPayload: TranscriptMessageContentPayload) -> String? {
        switch contentPayload.type {
        case "tool_use":
            return contentPayload.content
        case "thinking":
            return contentPayload.thinking
        case "tool_result":
            return contentPayload.content
        case "text":
            return contentPayload.text
        default:
            return contentPayload.type
        }
    }
}
