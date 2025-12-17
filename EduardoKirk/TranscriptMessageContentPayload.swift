//
//  TranscriptMessageContentPayload.swift
//  EduardoKirk
//
//  Created by ohataken on 2025/12/17.
//

struct TranscriptMessageContentPayload: Codable {
    let type: String
    let text: String?
    let content: String?
    let thinking: String?
    let input: TranscriptMessageContentInputPayload?
}
