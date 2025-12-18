//
//  CommandHandler.swift
//  EduardoKirk
//
//  Created by ohataken on 2025/12/16.
//

import UserNotifications

struct CommandHandler {
    static func isValidCommand(_ args: [String]) -> Bool {
        return SessionStartHandler.doesCommandMatch(args) ||
               SessionEndHandler.doesCommandMatch(args) ||
               UserPromptSubmitHandler.doesCommandMatch(args) ||
               NotificationHandler.doesCommandMatch(args) ||
               StopHandler.doesCommandMatch(args)
    }

    static func handle(_ args: [String]) async {
        let data = FileHandle.standardInput.readDataToEndOfFile()
        let stdin = String(data: data, encoding: .utf8) ?? ""

        if SessionStartHandler.doesCommandMatch(args) {
            await SessionStartHandler.handle(args: args, stdin: stdin)
        } else if SessionEndHandler.doesCommandMatch(args) {
            await SessionEndHandler.handle(args: args, stdin: stdin)
        } else if NotificationHandler.doesCommandMatch(args) {
            await NotificationHandler.handle(args: args, stdin: stdin)
        } else if StopHandler.doesCommandMatch(args) {
            await StopHandler.handle(args: args, stdin: stdin)
        } else if UserPromptSubmitHandler.doesCommandMatch(args) {
            await UserPromptSubmitHandler.handle(args: args, stdin: stdin)
        } else {
            print("Unknown command")
        }
    }
}
