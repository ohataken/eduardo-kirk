//
//  UserPromptSubmitHandler.swift
//  EduardoKirk
//
//  Created by ohataken on 2025/12/17.
//

import Foundation

struct UserPromptSubmitHandler: CommandHandlerProtocol {
    private static let notifier = OsascriptNotifier()

    static func doesCommandMatch(_ args: [String]) -> Bool {
        return args.count > 1 && args[1] == "user-prompt-submit"
    }
    
    static func handle(args: [String], stdin: String) {
        guard !stdin.isEmpty, let data = stdin.data(using: .utf8) else {
            fputs("No input received from stdin", stderr)
            return
        }

        let decoder = JSONDecoder()
        guard let payload = try? decoder.decode(UserPromptSubmitHookPayload.self, from: data) else {
            fputs("Failed to decode UserPromptSubmitHookPayload", stderr)
            return
        }

        try? notifier.notify(
            message: payload.prompt,
            title: "UserPromptSubmit - \(payload.cwdURL.lastPathComponent)",
            soundName: "Glass"
        )
    }
}
