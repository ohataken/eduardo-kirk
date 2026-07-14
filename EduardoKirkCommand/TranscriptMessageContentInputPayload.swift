//
//  TranscriptMessageContentInputPayload.swift
//  EduardoKirk
//
//  Created by ohataken on 2025/12/17.
//

struct TranscriptMessageContentInputPayload: Codable {
    let description: String?
    let command: String?
    let filePath: String?
    let content: String?
    let offset: Int?
    let limit: Int?
    let replaceAll: Bool?

    enum CodingKeys: String, CodingKey {
        case description
        case command
        case filePath = "file_path"
        case content
        case offset
        case limit
        case replaceAll = "replace_all"
    }
}
