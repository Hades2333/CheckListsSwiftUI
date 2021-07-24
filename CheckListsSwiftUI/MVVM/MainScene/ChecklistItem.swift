//
//  CheckListItem.swift
//  CheckListsSwiftUI
//
//  Created by Hellizar on 24.07.21.
//

import Foundation

struct ChecklistItem: Identifiable {
  let id = UUID()
  var name: String
  var isChecked: Bool = false
}
