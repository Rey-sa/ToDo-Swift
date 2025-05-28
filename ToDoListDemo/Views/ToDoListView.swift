import SwiftUI
import SwiftData

struct ToDoListView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.colorScheme) private var colorScheme //Dark-Light
    
    //Type Inference not possible due to Query
    @Query private var items: [ToDoItem]
    
    //Type inference
    @State private var showingAddToDo = false
    @State private var isDarkMode: Bool = true
    
    
    var body: some View {
        NavigationView{
            List{
                Section(){
                    ForEach(items.filter {!$0.isDone}){ item in
                        ToDoRowView(item: item)
                            .contentShape(Rectangle())
                            .onTapGesture{
                                toggleDone(item)
                            }
                        
                    }
                    //Memory safe with Swift
                    .onDelete(perform: deleteItems)
                }
                
                Section("Done"){
                    ForEach(items.filter {$0.isDone}){
                        item in ToDoRowView(item: item, done: true)
                            .contentShape(Rectangle())
                            .onTapGesture{
                                toggleDone(item)
                            }
                    }
                    .onDelete(perform: deleteItems)
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("ToDos")
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button{
                        isDarkMode.toggle()
                    } label: {
                        Image(systemName: isDarkMode ? "sun.max.fill" : "moon.fill")
                    }
            
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        showingAddToDo = true
                    } label: {
                        Image(systemName:"plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddToDo){
                AddToDoView()
            }
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
   
    //Showcase Parameter Labeling
    
    /*
    func addItem(taskTitle title: String, testLabel number: Int){
        let newItem = ToDoItem(title: title)
        context.insert(newItem)
    }
     */
     
     
    
    //Deletes items from data store based on the indices selected by user
    func deleteItems(at offsets: IndexSet){
        for index in offsets{
            context.delete(items[index])
        }
    }
    
    func toggleDone(_ item: ToDoItem){
        item.isDone.toggle()
    }

}

