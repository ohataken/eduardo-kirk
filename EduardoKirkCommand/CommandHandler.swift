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
}
