//
//  StopHookPayload.swift
//  EduardoKirk
//
//  Created by ohataken on 2025/12/17.
//

struct StopHookPayload: Codable {
    let sessionId: String
    let transcriptPath: String
    let cwd: String
    let hookEventName: String
    let stopHookActive: Bool

    enum CodingKeys: String, CodingKey {
        case sessionId = "session_id"
        case transcriptPath = "transcript_path"
        case cwd
        case hookEventName = "hook_event_name"
        case stopHookActive = "stop_hook_active"
    }
}
