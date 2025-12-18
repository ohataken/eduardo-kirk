//
//  SessionEndHandler.swift
//  EduardoKirk
//
//  Created by ohataken on 2025/12/17.
//

import Foundation

struct SessionEndHandler {
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

        let process = Process()
        process.executableURL = URL(fileURLWithPath: "/usr/bin/osascript")
        process.arguments = ["-e", "display notification \"handleSessionEnd\" with title \"handleSessionEnd\" sound name \"Glass\""]
        try? process.run()
        process.waitUntilExit()
    }
}
