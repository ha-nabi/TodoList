//
//  TaskRowView.swift
//  TodoList
//
//  Created by 강치우 on 11/11/23.
//

import SwiftUI

struct TaskRowView: View {
    @Bindable var task: Task
    // Model Conetxt
    @Environment(\.modelContext) private var context
    var body: some View {
        HStack(alignment: .top, spacing: 15, content: {
            Circle()
                .fill(indicatorColor)
                .frame(width: 10, height: 10)
                .padding(4)
                .background(.white.shadow(.drop(color: .black.opacity(0.1), radius: 3)), in: .circle)
                .overlay {
                    Circle()
                        .foregroundStyle(.clear)
                        .contentShape(.circle)
                        .frame(width: 50, height: 50)
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
            .background(task.tintColor, in: .rect(topLeadingRadius: 15, bottomLeadingRadius: 15))
            .strikethrough(task.isCompeleted, pattern: .solid, color: .black)
            .contentShape(.contextMenuPreview, .rect(cornerRadius: 15))
            .contextMenu {
                Button("일정 지우기", role: .destructive) {
                    // Deleting Task
                    context.delete(task)
                    try? context.save()
                }
            }
            .offset(y: -8)
        })
    }
    
    var indicatorColor: Color {
        if task.isCompeleted {
            return .green
        }
        
        return task.creationDate.isSameHour ? .darkblue : (task.creationDate.isPast ? .taskColor1 : .black)
    }
}

#Preview {
    ContentView()
}
