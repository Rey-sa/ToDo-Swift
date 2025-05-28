import SwiftUI
import SwiftData

@main
struct ToDoDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ToDoListView()
        }
        //SwiftData setup
        .modelContainer(for: ToDoItem.self)
    }
}

