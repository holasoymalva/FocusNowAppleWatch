//
//  ContentView.swift
//  FocusNow Watch App
//
//  Created by malva on 14/01/25.
//

import SwiftUI

class ContentViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    @Published var showingAddTask = false
}

struct ContentView: View {
    @StateObject private var pomodoroTimer = PomodoroTimer()
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Tasks")) {
                    ForEach(viewModel.tasks) { task in
                        TaskRow(task: task) { updatedTask in
                            if let index = viewModel.tasks.firstIndex(where: { $0.id == updatedTask.id }) {
                                viewModel.tasks[index] = updatedTask
                            }
                        }
                    }
                    .onDelete(perform: deleteTasks)
                }
                
                Button(action: { viewModel.showingAddTask = true }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Add Task")
                    }
                }
            }
            .navigationTitle("FocusNow")
        }
        .sheet(isPresented: $viewModel.showingAddTask) {
            AddTaskView(isPresented: $viewModel.showingAddTask) { taskTitle in
                let task = Task(title: taskTitle)
                viewModel.tasks.append(task)
            }
        }
    }
    
    private func deleteTasks(at offsets: IndexSet) {
        viewModel.tasks.remove(atOffsets: offsets)
    }
}
