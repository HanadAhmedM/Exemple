//
//  AddNewNoteView.swift
//  NoteApp
//
//  Created by Hanad.Ahmed on 2024-03-05.
//

import SwiftUI

struct AddNewNoteView: View {
    @StateObject var viewModel = NoteViewModel()
    @State private var title: String = ""
    @State private var discription: String = ""
    var onDismiss: () -> Void  // Add a closure to handle onDismiss action

    var body: some View {
        VStack {
            TextField("title", text: $title)
                .padding()

            TextField("Discription", text: $discription)
                .padding()

            Button("Add Note") {
                addNote()
                onDismiss()  // Call onDismiss when the "Add Note" button is tapped
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(20)
        }
    }

    func addNote() {
        if title.isEmpty {
            return
        }

        if discription.isEmpty {
            return
        }

        let currentDate = Date()

        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short

        _ = dateFormatter.string(from: currentDate)

        viewModel.addPerson(title: title, discription: discription, date: "22")
        title = ""
        discription = ""
    }
}

#Preview {
    AddNewNoteView {
           // This is a placeholder for your onDismiss logic
           print("AddNewNoteView dismissed")
       }
   }
