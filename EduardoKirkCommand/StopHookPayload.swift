//
//  StopHookPayload.swift
//  EduardoKirk
//
//  Created by ohataken on 2025/12/17.
//

import Foundation

struct StopHookPayload: Codable {
    let sessionId: String
    let transcriptPath: String
    let cwd: String
    let hookEventName: String
    let stopHookActive: Bool
    let notificationType: String?

    enum CodingKeys: String, CodingKey {
        case sessionId = "session_id"
        case transcriptPath = "transcript_path"
        case cwd
        case hookEventName = "hook_event_name"
        case stopHookActive = "stop_hook_active"
        case notificationType = "notification_type"
    }

    var cwdURL: URL {
        URL(fileURLWithPath: cwd)
    }
}
