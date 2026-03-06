//
//  TranscriptMessageContentInputPayload.swift
//  EduardoKirk
//
//  Created by ohataken on 2025/12/17.
//

struct TranscriptMessageContentInputPayload: Codable {
    let description: String?

    var content: String? {
        if description != nil {
            return description
        } else {
            return nil
        }
    }
}
