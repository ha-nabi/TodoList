//
//  Home.swift
//  TodoList
//
//  Created by 강치우 on 11/11/23.
//

import SwiftUI

struct Home: View {
    // Task Manager Properties
    @State private var currentDate: Date = .init()
    @State private var weekSlider: [] = []
    var body: some View {
        VStack(alignment: .leading, spacing: 0, content: {
            // Header View
            HeaderView()
        })
        .vSpacing(.top)
    }
    
    @ViewBuilder
    func HeaderView() -> some View {
        VStack(alignment: .leading, spacing: 6, content: {
            HStack(spacing: 5) {
                Text(currentDate.format("MMMM"))
                    .foregroundStyle(.blue)
                
                Text(currentDate.format("YYYY"))
                    .foregroundStyle(.gray)
            }
            .font(.title.bold())
            
            Text(currentDate.formatted(date: .complete, time: .omitted))
                .font(.callout)
                .fontWeight(.semibold)
                .textScale(.secondary)
                .foregroundStyle(.gray)
            
            // Week Slider
            
        })
        .hSpacing(.leading)
        .overlay(alignment: .topTrailing, content: {
            Button(action: {}, label: {
                Image(.picture2)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 45, height: 45)
                    .clipShape(.circle)
            })
        })
        .padding(15)
        .background(.white)
    }
}

#Preview {
    ContentView()
}
