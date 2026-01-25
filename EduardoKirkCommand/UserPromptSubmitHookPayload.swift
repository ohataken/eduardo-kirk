//
//  UserPromptSubmitHookPayload.swift
//  EduardoKirk
//
//  Created by ohataken on 2025/12/17.
//

import Foundation

struct UserPromptSubmitHookPayload: Codable {
    let sessionId: String
    let transcriptPath: String
    let cwd: String
    let hookEventName: String
    let prompt: String

    enum CodingKeys: String, CodingKey {
        case sessionId = "session_id"
        case transcriptPath = "transcript_path"
        case cwd
        case hookEventName = "hook_event_name"
        case prompt
    }

    var cwdURL: URL {
        URL(fileURLWithPath: cwd)
    }
}
