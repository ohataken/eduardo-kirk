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

    var message: String {
        switch type {
        case "tool_use", "tool_result":
            return content ?? type
        case "thinking":
            return thinking ?? type
        case "text":
            return text ?? type
        default:
            return type
        }
    }

    var soundName: String? {
        switch type {
        case "tool_use":
            return "Glass"
        case "thinking":
            return "Tink"
        case "tool_result":
            return "Sosumi"
        case "text":
            return "Morse"
        default:
            return nil
        }
    }
}
