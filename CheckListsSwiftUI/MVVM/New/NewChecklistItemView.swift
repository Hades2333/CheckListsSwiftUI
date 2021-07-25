//
//  NewChecklistItemView.swift
//  CheckListsSwiftUI
//
//  Created by Hellizar on 25.07.21.
//

import SwiftUI

struct NewChecklistItemView: View {

    // MARK: Properties

    var checklist: Checklist
    @State var newItemName = ""
    @Environment(\.presentationMode) var presentationMode

    // MARK: Views

    var body: some View {
        VStack {
            Text("Add new item")
            Form {
                TextField("Enter new item name here", text: $newItemName)
                Button(action: {
                    let newChecklistItem = ChecklistItem(name: self.newItemName)
                    self.checklist.items.append(newChecklistItem)
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Add new item")
                    }
                }
                .disabled(newItemName.count == 0)
            }
            Text("Swipe down to cancel.")
        }
    }
}

struct NewChecklistItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewChecklistItemView(checklist: Checklist())
    }
}
