//
//  ContentView.swift
//  TodoList
//
//  Created by 강치우 on 11/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.systemBackground))
            .preferredColorScheme(.light)
    }
}

#Preview {
    ContentView()
}
