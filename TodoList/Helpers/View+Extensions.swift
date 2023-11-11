//
//  View+Extensions.swift
//  TodoList
//
//  Created by 강치우 on 11/11/23.
//

import SwiftUI

// Custom View Extensions
extension View {
    // Custom Spacers 이거 완전 유용할듯 대박;
    func hSpacing(_ alignment: Alignment) -> some View {
        self
            .frame(maxWidth: .infinity, alignment: alignment)
    }
    
    @ViewBuilder
    func vSpacing(_ alignment: Alignment) -> some View {
        self
            .frame(maxHeight: .infinity, alignment: alignment)
    }
    
    // Checking Two dates are same
    func isSameDate(_ date1: Date, _ date2: Date) -> Bool {
        return Calendar.current.isDate(date1, inSameDayAs: date2)
    }
}


