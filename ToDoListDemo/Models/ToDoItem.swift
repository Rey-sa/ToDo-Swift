import Foundation
import SwiftData

@Model
class ToDoItem{
    var title: String
    var isDone: Bool
    
    //Optional
    var notes: String?
    
    init(title: String, isDone: Bool = false, notes: String? = nil){
        self.title = title
        self.isDone = isDone
        self.notes = notes
    }
}
