//
//  NewChecklistItemView.swift
//  ChecklistV1
//
//  Created by 황동준 on 2021/06/12.
//  Copyright © 2021 황동준. All rights reserved.
//

import SwiftUI

struct NewChecklistItemView: View {
    var body: some View {
        VStack {
            Text("Add new item")
            Text("Enter item name")
            Button(action: {}){
                HStack {
                    Image(systemName: "plus.circle.fill")
                    Text("add new item")
                }//end of HStack
            }//end of button
            Text("Swipe down to cancel")
        }//end of vstack
    }//end of body
}

struct NewChecklistItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewChecklistItemView()
    }
}
