//
//  TaskRowView.swift
//  TodoList
//
//  Created by 강치우 on 11/11/23.
//

import SwiftUI

struct TaskRowView: View {
    @Binding var task: Task
    var body: some View {
        HStack(alignment: .top, spacing: 15, content: {
            Circle()
                .fill(indicatorColor)
                .frame(width: 10, height: 10)
                .padding(4)
                .background(.white.shadow(.drop(color: .black.opacity(0.1), radius: 3)), in: .circle)
                .overlay {
                    Circle()
                        .frame(width: 50, height: 50)
                        .blendMode(.destinationOver)
                        // To make the button tap more accessible, i'm adding an invisible layer to receive the taps.
                        .onTapGesture {
                            withAnimation(.snappy) {
                                task.isCompeleted.toggle()
                            }
                        }
                }
            
            VStack(alignment: .leading, spacing: 8, content: {
                Text(task.taskTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                
                Label(task.creationDate.format("hh:mm a"), systemImage: "clock")
                    .font(.caption)
                    .foregroundStyle(.black)
            })
            .padding(15)
            .hSpacing(.leading)
            .background(task.tint, in: .rect(topLeadingRadius: 15, bottomLeadingRadius: 15))
            .strikethrough(task.isCompeleted, pattern: .solid, color: .black)
            .offset(y: -8)
        })
    }
    
    var indicatorColor: Color {
        if task.isCompeleted {
            return .green
        }
        
        return task.creationDate.isSameHour ? .darkblue : (task.creationDate.isPast ? .taskred : .black)
    }
}

#Preview {
    ContentView()
}
