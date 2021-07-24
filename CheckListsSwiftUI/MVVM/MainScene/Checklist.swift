//
//  CheckList.swift
//  CheckListsSwiftUI
//
//  Created by Hellizar on 24.07.21.
//

import Foundation

class Checklist: ObservableObject {

    // MARK: Properties
    
    @Published var items = [
        ChecklistItem(name: "Walk the dog"),
        ChecklistItem(name: "Brush my teeth"),
        ChecklistItem(name: "Learn iOS development", isChecked: true),
        ChecklistItem(name: "Soccer practice"),
        ChecklistItem(name: "Eat ice cream", isChecked: true),
    ]

    // MARK: Methods

    func deleteListItem(whichElement: IndexSet) {
        items.remove(atOffsets: whichElement)
    }

    func moveListItem(whichElement: IndexSet, destination: Int) {
        items.move(fromOffsets: whichElement, toOffset:
                                destination)
    }

}
