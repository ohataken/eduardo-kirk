//
//  TranscriptNotificationMessageBuilder.swift
//  EduardoKirk
//
//  Created on 2026/07/14.
//

struct TranscriptNotificationMessageBuilder {
    static func build(from content: TranscriptMessageContentPayload) -> String {
        switch content.type {
        case "tool_use", "tool_result":
            return buildToolMessage(from: content)
        case "thinking":
            return content.thinking ?? content.type
        case "text":
            return content.text ?? content.type
        default:
            return content.type
        }
    }

    private static func buildToolMessage(from content: TranscriptMessageContentPayload) -> String {
        guard let input = content.input else {
            return content.name
        }

        switch content.name {
        case "Bash":
            return input.description ?? input.command.map { "Bash: \($0)" } ?? content.name
        case "Read":
            return fileMessage(prefix: "Read", input: input)
        case "Write":
            return writeMessage(input: input)
        case "Edit":
            return editMessage(input: input)
        default:
            return input.description ?? content.name
        }
    }

    private static func fileMessage(prefix: String, input: TranscriptMessageContentInputPayload) -> String {
        guard let filePath = input.filePath else {
            return prefix
        }

        var suffixes: [String] = []
        if let offset = input.offset {
            suffixes.append("offset \(offset)")
        }
        if let limit = input.limit {
            suffixes.append("limit \(limit)")
        }

        guard !suffixes.isEmpty else {
            return "\(prefix) \(filePath)"
        }

        return "\(prefix) \(filePath) (\(suffixes.joined(separator: ", ")))"
    }

    private static func writeMessage(input: TranscriptMessageContentInputPayload) -> String {
        guard let filePath = input.filePath else {
            return "Write"
        }

        guard let content = input.content else {
            return "Write \(filePath)"
        }

        return "Write \(filePath) (\(content.count) chars)"
    }

    private static func editMessage(input: TranscriptMessageContentInputPayload) -> String {
        guard let filePath = input.filePath else {
            return "Edit"
        }

        guard input.replaceAll == true else {
            return "Edit \(filePath)"
        }

        return "Edit \(filePath) (replace all)"
    }
}
