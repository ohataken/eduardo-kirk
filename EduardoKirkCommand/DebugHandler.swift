//
//  DebugHandler.swift
//  EduardoKirk
//
//  Created by ohataken on 2025/12/21.
//

import Foundation

struct DebugHandler: CommandHandlerProtocol {
    static func doesCommandMatch(_ args: [String]) -> Bool {
        return args.count > 1 && args[1] == "debug"
    }

    static func handle(args: [String], stdin: String) {
        let process = Process()
        process.executableURL = URL(fileURLWithPath: "/usr/bin/osascript")
        process.arguments = ["-e", "display notification \"DebugHandler\" with title \"DebugHandler\" sound name \"Glass\""]
        try? process.run()
        process.waitUntilExit()
    }
}
