import SwiftUI
import SwiftData

struct AddToDoView: View {
    //Gets values from environment of view
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    //Renders View again, when title or notes are changing
    @State private var title: String = ""
    @State private var notes: String = ""
    
    var body: some View{
        NavigationView{
            Form{
                Section("Title"){
                    TextField("Insert Title", text: $title)
                }
                Section("Notes"){
                    TextField("Notes", text: $notes)
                }
            }
            .navigationTitle(Text("Add ToDo"))
            .toolbar{
                ToolbarItem(placement: .confirmationAction){
                    Button("Save"){
                        //Title required
                        guard !title.isEmpty else { return }
                        let newToDo = ToDoItem(title: title, notes: notes.isEmpty ? nil : notes)
                        context.insert(newToDo)
                        dismiss()
                    }
                    .disabled(title.isEmpty)
                }
                ToolbarItem(placement: .cancellationAction){
                    Button("Cancel"){
                        dismiss()
                    }
                }
            }
        }
    }
}
