//
//  ContentView.swift
//  CheckListsSwiftUI
//
//  Created by Hellizar on 24.07.21.
//

import SwiftUI

struct CheckListView: View {

    // MARK: Observe ViewModel

    @ObservedObject var checklist = Checklist()

    // MARK: View
    
    var body: some View {
        NavigationView {
            List {
                ForEach(checklist.items) { checklistItem in
                    HStack {
                        Text(checklistItem.name)
                        Spacer()
                        checklistItem.isChecked ? Text("☑️") : Text("🔲")
                    }
                    .background(Color(UIColor.systemBackground))
                    .onTapGesture {
                        if let matchingIndex = self.checklist.items.firstIndex(
                            where: { $0.id == checklistItem.id }) {
                            self.checklist.items[matchingIndex].isChecked.toggle()
                        }
                    }
                }
                .onDelete(perform: checklist.deleteListItem)
                .onMove(perform: checklist.moveListItem)
            }
            .navigationBarItems(trailing: EditButton())
            .navigationBarTitle("CheckList")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CheckListView()
    }
}
