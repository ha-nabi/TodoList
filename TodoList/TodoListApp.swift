//
//  TodoListApp.swift
//  TodoList
//
//  Created by 강치우 on 11/11/23.
//

import SwiftUI

@main
struct TodoListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Task.self)
    }
}
