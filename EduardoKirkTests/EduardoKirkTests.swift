//
//  EduardoKirkTests.swift
//  EduardoKirkTests
//
//  Created by ohataken on 2025/12/16.
//

import Testing
@testable import EduardoKirk

struct EduardoKirkTests {

    @Test func example() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    }
    
    @Test func testIsValidCommand_sessionStart() {
        let args = ["program", "session-start"]
        #expect(CommandHandler.isValidCommand(args) == true)
    }
    
    @Test func testIsValidCommand_sessionEnd() {
        let args = ["program", "session-end"]
        #expect(CommandHandler.isValidCommand(args) == true)
    }
    
    @Test func testIsValidCommand_userPromptSubmit() {
        let args = ["program", "user-prompt-submit"]
        #expect(CommandHandler.isValidCommand(args) == true)
    }
    
    @Test func testIsValidCommand_notification() {
        let args = ["program", "notification"]
        #expect(CommandHandler.isValidCommand(args) == true)
    }
    
    @Test func testIsValidCommand_stop() {
        let args = ["program", "stop"]
        #expect(CommandHandler.isValidCommand(args) == true)
    }
    
    @Test func testIsValidCommand_invalid() {
        let args = ["program", "invalid-command"]
        #expect(CommandHandler.isValidCommand(args) == false)
    }
    
    @Test func testIsValidCommand_emptyArgs() {
        let args: [String] = []
        #expect(CommandHandler.isValidCommand(args) == false)
    }
    
    @Test func testIsValidCommand_singleArg() {
        let args = ["program"]
        #expect(CommandHandler.isValidCommand(args) == false)
    }

}
