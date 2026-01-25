//
//  SessionEndHandler.swift
//  EduardoKirk
//
//  Created by ohataken on 2025/12/17.
//

import Foundation

struct SessionEndHandler: CommandHandlerProtocol {
    private static let notifier = OsascriptNotifier()

    static func doesCommandMatch(_ args: [String]) -> Bool {
        return args.count > 1 && args[1] == "session-end"
    }
    
    static func handle(args: [String], stdin: String) {
        guard !stdin.isEmpty, let data = stdin.data(using: .utf8) else {
            print("Failed to decode SessionEndHookPayload")
            return
        }

        let decoder = JSONDecoder()
        guard let payload = try? decoder.decode(SessionEndHookPayload.self, from: data) else {
            print("Failed to decode SessionEndHookPayload")
            return
        }

        try? notifier.notify(
            message: payload.cwd,
            title: "SessionEnd - \(payload.cwdURL.lastPathComponent)",
            soundName: "Glass"
        )
    }
}
