//
//  TranscriptMessagePayload.swift
//  EduardoKirk
//
//  Created by ohataken on 2025/12/17.
//

struct TranscriptMessagePayload: Codable {
    let model: String
    let id: String
    let type: String
    let role: String
    let content: TranscriptMessageContentUnion
    let stopReason: String?
    let stopSequence: String?

    enum CodingKeys: String, CodingKey {
        case model
        case id
        case type
        case role
        case content
        case stopReason = "stop_reason"
        case stopSequence = "stop_sequence"
    }
    
    var message: String {
        return content.message
    }
}
