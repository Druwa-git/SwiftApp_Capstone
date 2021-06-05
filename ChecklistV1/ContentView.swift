//
//  ContentView.swift
//  ChecklistV1
//
//  Created by 황동준 on 2021/05/30.
//  Copyright © 2021 황동준. All rights reserved.
//

import SwiftUI
struct ChecklistItem {
    var name: String
    var isChecked: Bool = false
}

struct ContentView: View {
    //@State var checklistItems = ["Do Capstone Design 1 Homework", "Wash dishes", "Do Capstone Design 2 Homework", "Watch Lecture 11", "Hang Out With Girlfriends", "Watch Lecture 12"]
    @State var checklistItems = [
        ChecklistItem(name : "Do Capstone Design 1 Homework"),
        ChecklistItem(name : "Wash dishes"),
        ChecklistItem(name : "Do Capstone Design 2 Homework", isChecked: true),
        ChecklistItem(name : "Watch Lecture 11"),
        ChecklistItem(name : "Hang Out With Girlfriends"),
        ChecklistItem(name : "Watch Lecture 12", isChecked: true),
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(checklistItems, id: \.self.name){
                    checklistItems in
                    HStack{
                        Text(checklistItems.name)
                        Spacer()
                        if checklistItems.isChecked {
                            Text("✔️")
                        }
                        else{
                            Text("⬛️")
                        }
                    }
                } //end of foreach
                .onDelete(perform: deleteListItem)
                .onMove(perform: moveListItem)
            } // end of List
            .navigationBarItems(trailing: EditButton())
            .navigationBarTitle("CheckList")
                .onAppear(){
                    self.printChecklistContents()
            }
        } //navigation end
    } //body end
    
    //Method
    func printChecklistContents(){
        for item in checklistItems{
            print(item)
        }
    }
    func deleteListItem(whichElement: IndexSet) {
        checklistItems.remove(atOffsets: whichElement)
        printChecklistContents()
    }
    func moveListItem(whichElement: IndexSet, destination: Int) {
        checklistItems.move(fromOffsets: whichElement, toOffset: destination)
        printChecklistContents()
    }
} //contentview end

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
