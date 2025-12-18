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
        #expect(CommandHandler.isValidCommand(args))
    }
    
    @Test func testIsValidCommand_sessionEnd() {
        let args = ["program", "session-end"]
        #expect(CommandHandler.isValidCommand(args))
    }
    
    @Test func testIsValidCommand_userPromptSubmit() {
        let args = ["program", "user-prompt-submit"]
        #expect(CommandHandler.isValidCommand(args))
    }
    
    @Test func testIsValidCommand_notification() {
        let args = ["program", "notification"]
        #expect(CommandHandler.isValidCommand(args))
    }
    
    @Test func testIsValidCommand_stop() {
        let args = ["program", "stop"]
        #expect(CommandHandler.isValidCommand(args))
    }
    
    @Test func testIsValidCommand_invalid() {
        let args = ["program", "invalid-command"]
        #expect(!CommandHandler.isValidCommand(args))
    }
    
    @Test func testIsValidCommand_emptyArgs() {
        let args: [String] = []
        #expect(!CommandHandler.isValidCommand(args))
    }
    
    @Test func testIsValidCommand_singleArg() {
        let args = ["program"]
        #expect(!CommandHandler.isValidCommand(args))
    }
    
    @Test func testSessionStartHandler_doesCommandMatch() {
        let args = ["program", "session-start"]
        #expect(SessionStartHandler.doesCommandMatch(args))
    }
    
    @Test func testSessionEndHandler_doesCommandMatch() {
        let args = ["program", "session-end"]
        #expect(SessionEndHandler.doesCommandMatch(args))
    }
    
    @Test func testUserPromptSubmitHandler_doesCommandMatch() {
        let args = ["program", "user-prompt-submit"]
        #expect(UserPromptSubmitHandler.doesCommandMatch(args))
    }
    
    @Test func testNotificationHandler_doesCommandMatch() {
        let args = ["program", "notification"]
        #expect(NotificationHandler.doesCommandMatch(args))
    }
    
    @Test func testStopHandler_doesCommandMatch() {
        let args = ["program", "stop"]
        #expect(StopHandler.doesCommandMatch(args))
    }
    
    @Test func testHandlers_doesCommandMatch_invalid() {
        let args = ["program", "invalid-command"]
        #expect(!SessionStartHandler.doesCommandMatch(args))
        #expect(!SessionEndHandler.doesCommandMatch(args))
        #expect(!UserPromptSubmitHandler.doesCommandMatch(args))
        #expect(!NotificationHandler.doesCommandMatch(args))
        #expect(!StopHandler.doesCommandMatch(args))
    }

}
