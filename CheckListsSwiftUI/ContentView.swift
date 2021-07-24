//
//  ContentView.swift
//  CheckListsSwiftUI
//
//  Created by Hellizar on 24.07.21.
//

import SwiftUI

struct ChecklistItem: Identifiable {
    let id = UUID()
    var name: String
    var isChecked: Bool = false
}

struct ContentView: View {

    @State var checklistItems = [
        ChecklistItem(name: "Walk the dog"),
        ChecklistItem(name: "Brush my teeth"),
        ChecklistItem(name: "Learn iOS development", isChecked: true),
        ChecklistItem(name: "Soccer practice"),
        ChecklistItem(name: "Eat ice cream", isChecked: true),
    ]

    var body: some View {
        NavigationView {
            List {
                ForEach(checklistItems) { checklistItem in
                    HStack {
                        Text(checklistItem.name)
                        Spacer()
                        checklistItem.isChecked ? Text("☑️") : Text("🔲")
                    }
                    .background(Color(UIColor.systemBackground))
                    .onTapGesture {
                        if let matchingIndex = self.checklistItems.firstIndex(
                            where: { $0.id == checklistItem.id }) {
                            self.checklistItems[matchingIndex].isChecked.toggle()
                        }
                    }
                }
                .onDelete(perform: deleteListItem)
                .onMove(perform: moveListItem)
            }
            .navigationBarItems(trailing: EditButton())
            .navigationBarTitle("CheckList")
        }
    }

    // MARK: Methods

    func deleteListItem(whichElement: IndexSet) {
        checklistItems.remove(atOffsets: whichElement)
    }

    func moveListItem(whichElement: IndexSet, destination: Int) {
        checklistItems.move(fromOffsets: whichElement, toOffset:
                                destination)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
