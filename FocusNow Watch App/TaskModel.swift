//
//  TaskModel.swift
//  FocusNow
//
//  Created by malva on 14/01/25.
//

import Foundation

struct Task: Identifiable, Codable {
    var id = UUID()
    var title: String
    var isCompleted: Bool = false
    var createdAt: Date = Date()
}
