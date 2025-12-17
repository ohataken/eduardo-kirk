//
//  EduardoKirkApp.swift
//  EduardoKirk
//
//  Created by ohataken on 2025/12/16.
//

import SwiftUI

@main
struct EduardoKirkApp: App {
    init() {
        Task {
            if (CommandHandler.isValidCommand(CommandLine.arguments)) {
                await CommandHandler.handle(CommandLine.arguments)
                exit(0)
            }
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
