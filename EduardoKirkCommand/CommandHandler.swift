//
//  CommandHandler.swift
//  EduardoKirk
//
//  Created by ohataken on 2025/12/17.
//

import Foundation

struct CommandHandler {
    static func isValidCommand(_ args: [String]) -> Bool {
        return SessionStartHandler.doesCommandMatch(args) ||
               SessionEndHandler.doesCommandMatch(args) ||
               UserPromptSubmitHandler.doesCommandMatch(args) ||
               NotificationHandler.doesCommandMatch(args) ||
               StopHandler.doesCommandMatch(args)
    }

    static func handle(_ args: [String]) {
        let data = FileHandle.standardInput.readDataToEndOfFile()
        let stdin = String(data: data, encoding: .utf8) ?? ""

        if SessionStartHandler.doesCommandMatch(args) {
            SessionStartHandler.handle(args: args, stdin: stdin)
        } else if SessionEndHandler.doesCommandMatch(args) {
            SessionEndHandler.handle(args: args, stdin: stdin)
        } else if NotificationHandler.doesCommandMatch(args) {
            NotificationHandler.handle(args: args, stdin: stdin)
        } else if StopHandler.doesCommandMatch(args) {
            StopHandler.handle(args: args, stdin: stdin)
        } else if UserPromptSubmitHandler.doesCommandMatch(args) {
            UserPromptSubmitHandler.handle(args: args, stdin: stdin)
        } else {
            print("Unknown command")
        }
    }
}
