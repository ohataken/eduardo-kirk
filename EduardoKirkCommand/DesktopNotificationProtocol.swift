//
//  DesktopNotificationProtocol.swift
//  EduardoKirk
//
//  Created by ohataken on 2025/12/29.
//

import Foundation

protocol DesktopNotificationProtocol {
    func notify(message: String, title: String, soundName: String?) throws
}
