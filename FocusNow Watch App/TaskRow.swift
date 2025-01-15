//
//  TaskRow.swift
//  FocusNow
//
//  Created by malva on 14/01/25.
//
import SwiftUI

struct TaskRow: View {
    let task: Task
    let onUpdate: (Task) -> Void
    
    var body: some View {
        Button(action: {
            var updatedTask = task
            updatedTask.isCompleted.toggle()
            onUpdate(updatedTask)
        }) {
            HStack {
                Text(task.title)
                    .strikethrough(task.isCompleted)
                    .foregroundColor(task.isCompleted ? .gray : .white)
                
                Spacer()
                
                if task.isCompleted {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                }
            }
        }
    }
}
