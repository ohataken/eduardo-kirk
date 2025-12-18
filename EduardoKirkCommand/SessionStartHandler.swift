//
//  SessionStartHandler.swift
//  EduardoKirk
//
//  Created by ohataken on 2025/12/17.
//

import Foundation

struct SessionStartHandler: CommandHandlerProtocol {
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

        let process = Process()
        process.executableURL = URL(fileURLWithPath: "/usr/bin/osascript")
        process.arguments = ["-e", "display notification \"handleSessionStart\" with title \"handleSessionStart\" sound name \"Glass\""]
        try? process.run()
        process.waitUntilExit()
    }
}
