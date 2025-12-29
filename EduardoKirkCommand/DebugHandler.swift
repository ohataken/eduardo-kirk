//
//  DebugHandler.swift
//  EduardoKirk
//
//  Created by ohataken on 2025/12/21.
//

import Foundation

struct DebugHandler: CommandHandlerProtocol {
    private static let notifier = OsascriptNotifier()

    static func doesCommandMatch(_ args: [String]) -> Bool {
        return args.count > 1 && args[1] == "debug"
    }

    static func handle(args: [String], stdin: String) {
        try? notifier.notify(
            message: "DebugHandler",
            title: "DebugHandler",
            soundName: "Glass"
        )
    }
}
