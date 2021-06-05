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
    
    var body: some View {
        NavigationView {
            List {
                ForEach(checklist.items){
                    checklistItems in
                    HStack{
                        Text(checklistItems.name)
                        Spacer()
                        Text( checklistItems.isChecked ? "✔️" : "⬛️")
                    }
                    .background(Color.white)
                    .onTapGesture {
                        if let matchingIndex = self.checklist.items.firstIndex(where: {
                            $0.id == checklistItems.id
                        }){
                            self.checklist.items[matchingIndex].isChecked.toggle()
                        }
                        self.checklist.printChecklistContents()
                        print("The user tapped a list view \(checklistItems.name).")
                    }
                } //end of foreach
                    .onDelete(perform: checklist.deleteListItem)
                    .onMove(perform: checklist.moveListItem)
            } // end of List
            .navigationBarItems(trailing: EditButton())
            .navigationBarTitle("CheckList")
                .onAppear(){
                    self.checklist.printChecklistContents()
            }
        } //navigation end
    } //body end
} //contentview end

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistView()
    }
}
