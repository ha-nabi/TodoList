//
//  Task.swift
//  TodoList
//
//  Created by 강치우 on 11/11/23.
//

import SwiftUI

struct Task: Identifiable {
    var id: UUID = .init()
    var taskTitle: String
    var creationDate: Date = .init()
    var isCompeleted: Bool = false
    var tint: Color
}

var sampleTasks: [Task] = [
    .init(taskTitle: "Record Video", creationDate: .updateHour(-5), isCompeleted: true, tint: .darkgreen),
    .init(taskTitle: "Redesign Website", creationDate: .updateHour(-3), tint: .taskpink),
    .init(taskTitle: "Go for a Walk", creationDate: .updateHour(-4), tint: .hotpink),
    .init(taskTitle: "Edit Video", creationDate: .updateHour(0), isCompeleted: true, tint: .easygreen),
    .init(taskTitle: "Publish Video", creationDate: .updateHour(2), isCompeleted: true, tint: .mediumgreen),
    .init(taskTitle: "Tweet about new Video!", creationDate: .updateHour(-5), isCompeleted: true, tint: .taskred),
]

extension Date {
    static func updateHour(_ value: Int) -> Date {
        let calendar = Calendar.current
        return calendar.date(byAdding: .hour, value: value, to: .init()) ?? .init()
    }
}
