//
//  TodoViews.swift
//  TodoView
//
//  Created by Prem Sai K Varma on 10/7/25.
//

import SwiftUI

struct TodoViews: View {
    @State private var newtask: String = ""
    @State private var taskQueues: [String] = []
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                TextField("Add new task...", text: $newtask)
                    .textFieldStyle(.roundedBorder)
                Spacer(minLength: 8)
                Button("Add Task") {
                    guard !newtask.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
                        return
                    }
                    taskQueues.append(newtask)
                    newtask = ""
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
            }
            .padding(.horizontal)
            
            List(taskQueues, id: \.self) { task in
                Text(task)
            }
        }
        .padding(.top, 40)
    }
}

#Preview {
    TodoViews()
}
