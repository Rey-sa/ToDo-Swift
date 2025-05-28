import SwiftUI
import SwiftData

struct ToDoRowView: View{
    @Bindable var item: ToDoItem
    var done: Bool = false
    
    var body: some View{
        VStack(alignment: .leading, spacing: 4){
            HStack{
                Text(item.title)
                    .opacity(done ? 0.2 : 1)
                Spacer()
                Image(systemName: done ? "checkmark.circle.fill" : "circle").foregroundColor(done ? .green : .gray)
            }
            
            if !done, let notes = item.notes, !notes.isEmpty{
                Text(notes)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .opacity(0.8)
            }
        }
        .padding(.vertical, 4)
    }
    
}
