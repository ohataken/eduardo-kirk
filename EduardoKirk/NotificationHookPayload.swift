//
//  NotificationHookPayload.swift
//  EduardoKirk
//
//  Created by ohataken on 2025/12/16.
//

import Foundation

struct NotificationHookPayload: Codable {
    let sessionId: String
    let transcriptPath: String
    let cwd: String
    let hookEventName: String
    let timestamp: Date

    enum CodingKeys: String, CodingKey {
        case sessionId = "session_id"
        case transcriptPath = "transcript_path"
        case cwd
        case hookEventName = "hook_event_name"
        case timestamp
    }
}
