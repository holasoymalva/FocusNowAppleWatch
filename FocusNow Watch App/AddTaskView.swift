//
//  AddTaskView.swift
//  FocusNow
//
//  Created by malva on 14/01/25.
//
import SwiftUI

struct AddTaskView: View {
    @Binding var isPresented: Bool
    let onAdd: (String) -> Void
    @State private var taskTitle = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Task title", text: $taskTitle)
                    .textInputAutocapitalization(.never)
            }
            .navigationTitle("New Task")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        isPresented = false
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        if !taskTitle.isEmpty {
                            onAdd(taskTitle)
                            isPresented = false
                        }
                    }
                }
            }
        }
    }
}
