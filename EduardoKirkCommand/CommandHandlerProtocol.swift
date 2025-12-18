//
//  CommandHandlerProtocol.swift
//  EduardoKirk
//
//  Created by ohataken on 2025/12/18.
//

import Foundation

protocol CommandHandlerProtocol {
    static func doesCommandMatch(_ args: [String]) -> Bool
    static func handle(args: [String], stdin: String)
}
