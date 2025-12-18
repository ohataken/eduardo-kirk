//
//  TranscriptFileParser.swift
//  EduardoKirk
//
//  Created by ohataken on 2025/12/17.
//

struct TranscriptFileParser {
    static func getPayloadWithMaxTimestamp(from payloads: [TranscriptPayload]) -> TranscriptPayload? {
        return payloads
            .filter { $0.timestamp != nil }
            .max { a, b in
                (a.timestamp ?? "") < (b.timestamp ?? "")
            }
    }
}
