//
//  TranscriptPayload.swift
//  EduardoKirk
//
//  Created by ohataken on 2025/12/17.
//

struct TranscriptPayload: Codable {
    let type: String
    let uuid: String?
    let sessionId: String?
    let userType: String?
    let cwd: String?
    let timestamp: String?
}
