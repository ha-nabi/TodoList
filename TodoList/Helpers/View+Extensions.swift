//
//  View+Extensions.swift
//  TodoList
//
//  Created by 강치우 on 11/11/23.
//

import SwiftUI

// Custom View Extensions
extension View {
    // Custom Spacers
    func hSpacing(_ alignment: Alignment) -> some View {
        self
            .frame(maxWidth: .infinity, alignment: alignment)
    }
    
    @ViewBuilder
    func vSpacing(_ alignment: Alignment) -> some View {
        self
            .frame(maxHeight: .infinity, alignment: alignment)
    }
}
