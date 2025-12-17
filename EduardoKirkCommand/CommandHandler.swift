//
//  CommandHandler.swift
//  EduardoKirk
//
//  Created by ohataken on 2025/12/17.
//

import Foundation

struct CommandHandler {
    private static func isSessionStart(_ args: [String]) -> Bool {
        return args.count > 1 && args[1] == "session-start"
    }

    private static func isSessionEnd(_ args: [String]) -> Bool {
        return args.count > 1 && args[1] == "session-end"
    }
    
    private static func isUserPromptSubmit(_ args: [String]) -> Bool {
        return args.count > 1 && args[1] == "user-prompt-submit"
    }

    private static func isNotification(_ args: [String]) -> Bool {
        return args.count > 1 && args[1] == "notification"
    }

    private static func isStop(_ args: [String]) -> Bool {
        return args.count > 1 && args[1] == "stop"
    }
    
    static func isValidCommand(_ args: [String]) -> Bool {
        return isSessionStart(args) ||
               isSessionEnd(args) ||
               isUserPromptSubmit(args) ||
               isNotification(args) ||
               isStop(args)
    }
    
    private static func handleSessionStart(args: [String], stdin: String) {
        guard !stdin.isEmpty, let data = stdin.data(using: .utf8) else {
            print("Failed to decode SessionStartHookPayload")
            return
        }

        let decoder = JSONDecoder()
        guard let payload = try? decoder.decode(SessionStartHookPayload.self, from: data) else {
            print("Failed to decode SessionStartHookPayload")
            return
        }
    }

    private static func handleSessionEnd(args: [String], stdin: String) {
        guard !stdin.isEmpty, let data = stdin.data(using: .utf8) else {
            print("Failed to decode SessionEndHookPayload")
            return
        }

        let decoder = JSONDecoder()
        guard let payload = try? decoder.decode(SessionEndHookPayload.self, from: data) else {
            print("Failed to decode SessionEndHookPayload")
            return
        }
    }

    private static func handleNotification(args: [String], stdin: String) {
        guard !stdin.isEmpty, let data = stdin.data(using: .utf8) else {
            print("Failed to decode NotificationHookPayload")
            return
        }

        let decoder = JSONDecoder()
        guard let payload = try? decoder.decode(NotificationHookPayload.self, from: data) else {
            print("Failed to decode NotificationHookPayload")
            return
        }

        guard let fileContent = try? String(contentsOfFile: payload.transcriptPath, encoding: .utf8) else {
            print("Failed to read transcript file")
            return
        }

        var transcripts: [TranscriptPayload] = []
        let lines = fileContent.split(separator: "\n", omittingEmptySubsequences: false).map(String.init)

        for line in lines {
            guard let lineData = line.data(using: .utf8) else {
                continue
            }

            if let transcript = try? decoder.decode(TranscriptPayload.self, from: lineData) {
                transcripts.append(transcript)
            }
        }
    }

    private static func handleStop(args: [String], stdin: String) {
        guard !stdin.isEmpty, let data = stdin.data(using: .utf8) else {
            print("Failed to decode StopHookPayload")
            return
        }

        let decoder = JSONDecoder()
        guard let payload = try? decoder.decode(StopHookPayload.self, from: data) else {
            print("Failed to decode StopHookPayload")
            return
        }
    }

    private static func handleUserPromptSubmit(args: [String], stdin: String) {
        guard !stdin.isEmpty, let data = stdin.data(using: .utf8) else {
            print("Failed to decode UserPromptSubmitHookPayload")
            return
        }

        let decoder = JSONDecoder()
        guard let payload = try? decoder.decode(UserPromptSubmitHookPayload.self, from: data) else {
            print("Failed to decode UserPromptSubmitHookPayload")
            return
        }
    }

    static func handle(_ args: [String]) {
        let data = FileHandle.standardInput.readDataToEndOfFile()
        let stdin = String(data: data, encoding: .utf8) ?? ""

        if isSessionStart(args) {
            handleSessionStart(args: args, stdin: stdin)
        } else if isSessionEnd(args) {
            handleSessionEnd(args: args, stdin: stdin)
        } else if isNotification(args) {
            handleNotification(args: args, stdin: stdin)
        } else if isStop(args) {
            handleStop(args: args, stdin: stdin)
        } else if isUserPromptSubmit(args) {
            handleUserPromptSubmit(args: args, stdin: stdin)
        } else {
            print("Unknown command")
        }
    }
}
