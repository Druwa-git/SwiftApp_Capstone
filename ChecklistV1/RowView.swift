//
//  RowView.swift
//  ChecklistV1
//
//  Created by 황동준 on 2021/06/12.
//  Copyright © 2021 황동준. All rights reserved.
//

import SwiftUI

struct RowView: View {
    @State var checklistItem: ChecklistItem
    var body: some View {
        NavigationLink(destination: EditChecklistItemView()){
            HStack{
                Text(checklistItem.name)
                Spacer()
                Text( checklistItem.isChecked ? "✔️" : "⬛️")
            }//end of hstack
        }//end of NavigationLink
    }//end of view
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(checklistItem: ChecklistItem(name: "Sample item"))
    }
}
