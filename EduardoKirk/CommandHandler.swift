//
//  CommandHandler.swift
//  EduardoKirk
//
//  Created by ohataken on 2025/12/16.
//

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
    
    private static func handleSessionStart(args: [String], stdin: String) async {
    }

    private static func handleSessionEnd(args: [String], stdin: String) async {
    }

    private static func handleNotification(args: [String], stdin: String) async {
    }

    private static func handleStop(args: [String], stdin: String) async {
    }
}
