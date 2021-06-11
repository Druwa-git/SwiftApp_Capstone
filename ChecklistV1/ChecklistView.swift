//
//  ContentView.swift
//  ChecklistV1
//
//  Created by 황동준 on 2021/05/30.
//  Copyright © 2021 황동준. All rights reserved.
//

import SwiftUI


struct ChecklistView: View {
    //@State var checklistItems = ["Do Capstone Design 1 Homework", "Wash dishes", "Do Capstone Design 2 Homework", "Watch Lecture 11", "Hang Out With Girlfriends", "Watch Lecture 12"]
    
    @ObservedObject var checklist = Checklist()
    @State var newChecklistItemViewIsVisible = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(checklist.items){
                    index in
                        RowView(checklistItem: self.$checklist.items[index])
                } //end of foreach
                    .onDelete(perform: checklist.deleteListItem)
                    .onMove(perform: checklist.moveListItem)
            } // end of List
            .navigationBarItems(
                leading: Button(action: {self.newChecklistItemViewIsVisible = true}) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Add Item")
                    }
                },
                trailing: EditButton())
            .navigationBarTitle("CheckList")
                .onAppear(){
                    self.checklist.printChecklistContents()
            }
        } //navigation end
        .sheet(isPresented: $newChecklistItemViewIsVisible) {
            NewChecklistItemView(checklist: self.checklist)
        }
    } //body end
} //contentview end

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistView()
    }
}
