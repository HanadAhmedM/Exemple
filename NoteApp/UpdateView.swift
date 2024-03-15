//
//  UpdateView.swift
//  NoteApp
//
//  Created by Hanad.Ahmed on 2024-03-11.
//

import SwiftUI

struct UpdateView: View {
    @State var title: String
       @State var discription: String
       var entity: Note
       @ObservedObject var viewModel = NoteViewModel()
       @Environment(\.presentationMode) var presentationMode

       var body: some View {
           VStack {
               TextField("title", text: $title)
                   .padding()

               TextField("Description", text: $discription)
                   .padding()

               HStack {
                   Button("Update") {
                       if title.isEmpty || discription.isEmpty {
                           return
                       }

                       let currentDate = Date()
                       let dateFormatter = DateFormatter()
                       dateFormatter.dateStyle = .short
                       dateFormatter.timeStyle = .short

                       let dateNow = dateFormatter.string(from: currentDate)
                       viewModel.updateNote(entity: entity, NewTitle: title, newDiscription: discription, newDate: dateNow)

                       // Dismiss the current view
                       presentationMode.wrappedValue.dismiss()
                   }
                   .padding()
                   .background(Color.blue)
                   .foregroundColor(.white)
                   .cornerRadius(20)

                   Button("Delete") {
                       viewModel.deleteNote2(entity: entity)
                       // Dismiss the current view
                                          presentationMode.wrappedValue.dismiss()
                   }
                   .padding()
                   .background(Color.blue)
                   .foregroundColor(.white)
                   .cornerRadius(20)
               }
           }
       }
   }
