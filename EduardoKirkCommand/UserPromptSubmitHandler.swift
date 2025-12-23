//
//  UserPromptSubmitHandler.swift
//  EduardoKirk
//
//  Created by ohataken on 2025/12/17.
//

import Foundation

struct UserPromptSubmitHandler: CommandHandlerProtocol {
    static func doesCommandMatch(_ args: [String]) -> Bool {
        return args.count > 1 && args[1] == "user-prompt-submit"
    }
    
    static func handle(args: [String], stdin: String) {
        guard !stdin.isEmpty, let data = stdin.data(using: .utf8) else {
            print("Failed to decode UserPromptSubmitHookPayload")
            return
        }

        let decoder = JSONDecoder()
        guard let payload = try? decoder.decode(UserPromptSubmitHookPayload.self, from: data) else {
            print("Failed to decode UserPromptSubmitHookPayload")
            return
        }

        let process = Process()
        process.executableURL = URL(fileURLWithPath: "/usr/bin/osascript")
        process.arguments = ["-e", "display notification \"handleUserPromptSubmit\" with title \"UserPromptSubmit - Claude Code\" sound name \"Glass\""]
        try? process.run()
        process.waitUntilExit()
    }
}
