//
//  NewTaskView.swift
//  TodoList
//
//  Created by 강치우 on 11/11/23.
//

import SwiftUI

struct NewTaskView: View {
    // View Properties
    @Environment(\.dismiss) private var dismiss
    // Model Context For Saving Data
    @Environment(\.modelContext) private var context
    @State private var taskTitle: String = ""
    @State private var taskDate: Date = .init()
    @State private var taskColor: String = "TaskColor 1"
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.title)
                    .tint(.red)
            })
            .hSpacing(.leading)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("제목")
                    .font(.caption)
                    .foregroundStyle(.gray)
                
                TextField("멋쟁이 사자처럼 앱스쿨 3기 졸업하기", text: $taskTitle)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 15)
                    .background(.white.shadow(.drop(color: .black.opacity(0.25), radius: 2)), in: .rect(cornerRadius: 10))
            }
            .padding(.top, 5)
            
            HStack(spacing: 12) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("날짜")
                        .font(.caption)
                        .foregroundStyle(.gray)
                    
                    DatePicker("", selection: $taskDate)
                        .datePickerStyle(.compact)
                        .scaleEffect(0.9, anchor: .leading)
                }
                // 터치 할 수 있는 공간 제공
                .padding(.trailing, -15)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("색상")
                        .font(.caption)
                        .foregroundStyle(.gray)
                    
                    let colors: [String] = (1...5).compactMap { index -> String in
                        return "TaskColor \(index)"
                    }
                    HStack(spacing: 0) {
                        ForEach(colors, id: \.self) { color in
                            Circle()
                                .fill(Color(color))
                                .frame(width: 20, height: 20)
                                .background {
                                    Circle()
                                        .stroke(lineWidth: 2)
                                        .opacity(taskColor == color ? 1 : 0)
                                    
                                }
                                .hSpacing(.center)
                                .contentShape(.rect)
                                .onTapGesture {
                                    withAnimation(.snappy) {
                                        taskColor = color
                                    }
                                }
                        }
                    }
                }
                
            }
            .padding(.top, 5)
            
            Spacer(minLength: 0)
            
            Button {
                // 일정 저장
                let task = Task(taskTitle: taskTitle, creationDate: taskDate, tint: taskColor)
                do {
                    context.insert(task)
                    try context.save()
                    // 일정 생성 후 뷰 강제 닫기
                    dismiss()
                } catch {
                    print(error.localizedDescription)
                }
            } label: {
                Text("일정 만들기")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .textScale(.secondary)
                    .foregroundStyle(.black)
                    .hSpacing(.center)
                    .padding(.vertical, 12)
                    .background(Color(taskColor), in: .rect(cornerRadius: 10))
            }
            .disabled(taskTitle == "")
            .opacity(taskTitle == "" ? 0.5 : 1)
        }
        .padding(15)
    }
}

#Preview {
    NewTaskView()
        .vSpacing(.bottom)
}
