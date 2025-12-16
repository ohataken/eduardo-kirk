//
//  StopHookPayload.swift
//  EduardoKirk
//
//  Created by ohataken on 2025/12/16.
//

import Foundation

struct StopHookPayload: Codable {
    let sessionId: String
    let transcriptPath: String
    let cwd: String
    let permissionMode: String
    let hookEventName: String
    let stopHookActive: Bool

    enum CodingKeys: String, CodingKey {
        case sessionId = "session_id"
        case transcriptPath = "transcript_path"
        case cwd
        case permissionMode = "permission_mode"
        case hookEventName = "hook_event_name"
        case stopHookActive = "stop_hook_active"
    }
}
