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
    @State var checklistItems = [
        ChecklistItem(name : "Do Capstone Design 1 Homework", isChecked: false),
        ChecklistItem(name : "Wash dishes", isChecked: false),
        ChecklistItem(name : "Do Capstone Design 2 Homework", isChecked: true),
        ChecklistItem(name : "Watch Lecture 11", isChecked: false),
        ChecklistItem(name : "Hang Out With Girlfriends", isChecked: true),
        ChecklistItem(name : "Watch Lecture 11", isChecked: true),
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(checklistItems){
                    checklistItems in
                    HStack{
                        Text(checklistItems.name)
                        Spacer()
                        Text( checklistItems.isChecked ? "✔️" : "⬛️")
                    }
                    .background(Color.white)
                    .onTapGesture {
                        if let matchingIndex = self.checklistItems.firstIndex(where: {
                            $0.id == checklistItems.id
                        }){
                            self.checklistItems[matchingIndex].isChecked.toggle()
                        }
                        self.printChecklistContents()
                        print("The user tapped a list view \(checklistItems.name).")
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
        ChecklistView()
    }
}
