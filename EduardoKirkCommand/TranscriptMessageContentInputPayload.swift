//
//  TranscriptMessageContentInputPayload.swift
//  EduardoKirk
//
//  Created by ohataken on 2025/12/17.
//

struct TranscriptMessageContentInputPayload: Codable {
    let description: String?
    let plan: String?
    let file_path: String?

    var content: String? {
        if description != nil {
            return "description"
        } else if plan != nil {
            return "plan"
        } else if file_path != nil {
            return file_path
        } else {
            return nil
        }
    }
}
