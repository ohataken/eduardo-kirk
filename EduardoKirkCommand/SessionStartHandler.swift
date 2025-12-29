//
//  SessionStartHandler.swift
//  EduardoKirk
//
//  Created by ohataken on 2025/12/17.
//

import Foundation

struct SessionStartHandler: CommandHandlerProtocol {
    private static let notifier = OsascriptNotifier()

    static func doesCommandMatch(_ args: [String]) -> Bool {
        return args.count > 1 && args[1] == "session-start"
    }
    
    static func handle(args: [String], stdin: String) {
        guard !stdin.isEmpty, let data = stdin.data(using: .utf8) else {
            print("Failed to decode SessionStartHookPayload")
            return
        }

        let decoder = JSONDecoder()
        guard let payload = try? decoder.decode(SessionStartHookPayload.self, from: data) else {
            print("Failed to decode SessionStartHookPayload")
            return
        }

        try? notifier.notify(
            message: payload.cwd,
            title: "SessionStart - Claude Code",
            soundName: "Glass"
        )
    }
}
