//
//  Untitled.swift
//  EduardoKirk
//
//  Created by ohataken on 2026/01/26.
//

enum TranscriptMessageContentUnion: Codable {
    case array([TranscriptMessageContentPayload])
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let array = try? container.decode([TranscriptMessageContentPayload].self) {
            self = .array(array)
        } else if let string = try? container.decode(String.self) {
            self = .string(string)
        } else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "content must be an array or string")
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .array(let array):
            try container.encode(array)
        case .string(let string):
            try container.encode(string)
        }
    }

    var message: String {
        switch self {
        case .array(let array):
            return array.first!.message
        case .string(let string):
            return string
        }
    }

    var type: String {
        switch self {
        case .array(let array):
            return array.first!.type
        case .string(let string):
            return "text"
        }
    }

    var soundName: String? {
        switch self {
        case .array(let array):
            return array.first!.soundName
        case .string(let string):
            return nil
        }
    }
}
