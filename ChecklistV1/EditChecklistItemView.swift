//
//  EditChecklistItemView.swift
//  ChecklistV1
//
//  Created by 황동준 on 2021/06/06.
//  Copyright © 2021 황동준. All rights reserved.
//

import SwiftUI

struct EditChecklistItemView: View {
    @Binding var checklistItem: ChecklistItem
    var body: some View {
        Form {
            TextField("Name", text: $checklistItem.name)
            Toggle("Completed", isOn: $checklistItem.isChecked)
        }//end of form
        .onAppear(){
            print("Appear Edit")
        }
        .onDisappear(){
            print("Disappear Edit")
        }
    }//end of body
}//end of struct

struct EditChecklistItemView_Previews: PreviewProvider {
    static var previews: some View {
        EditChecklistItemView(checklistItem: .constant(ChecklistItem(name: "Sample item")))
    }
}
