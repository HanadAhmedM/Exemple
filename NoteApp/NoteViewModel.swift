import Foundation
import CoreData

class NoteViewModel: ObservableObject {
    
    @Published var Notes: [Note] = []
    
    private var container: NSPersistentContainer

    init(container: NSPersistentContainer = Persistence.shared.container) {
        self.container = container
        fetchNotes()
    }
    
    func fetchNotes() {
        let request = NSFetchRequest<Note>(entityName: "Note")

        do {
            Notes = try container.viewContext.fetch(request)
            print("Fetch successful. Number of notes: \(Notes.count)")
        } catch let error as NSError {
            print("Error fetching notes: \(error.localizedDescription)")
        }
    }

    func addPerson(title: String, discription: String, date: String) {
        let newNote = Note(context: container.viewContext)
        newNote.title = title
        newNote.discription = discription
        newNote.date = date

        saveData()
    }
    
    func updateNote(entity: Note, NewTitle: String, newDiscription: String, newDate: String) {
        entity.title = NewTitle
        entity.discription = newDiscription
        entity.date = newDate

        saveData()
    }
    
    func deleteNote2(entity: Note) {
        container.viewContext.delete(entity)
        saveData()
    }

    private func saveData() {
        do {
            try container.viewContext.save()
            fetchNotes() // Move the fetchNotes call here
        } catch let error {
            print("Error saving data: \(error)")
        }
    }
}
