//
//  Checklist.swift
//  ChecklistV1
//
//  Created by 황동준 on 2021/06/06.
//  Copyright © 2021 황동준. All rights reserved.
//

import Foundation

class Checklist: ObservableObject {
    @Published var items = [
        ChecklistItem(name : "Do Capstone Design 1 Homework", isChecked: false),
        ChecklistItem(name : "Wash dishes", isChecked: false),
        ChecklistItem(name : "Do Capstone Design 2 Homework", isChecked: true),
        ChecklistItem(name : "Watch Lecture 11", isChecked: false),
        ChecklistItem(name : "Hang Out With Girlfriends", isChecked: true),
        ChecklistItem(name : "Watch Lecture 11", isChecked: true),
    ]
    //Method
    func printChecklistContents(){
        for item in items{
            print(item)
        }
    }
    func deleteListItem(whichElement: IndexSet) {
        items.remove(atOffsets: whichElement)
        printChecklistContents()
    }
    func moveListItem(whichElement: IndexSet, destination: Int) {
        items.move(fromOffsets: whichElement, toOffset: destination)
        printChecklistContents()
    }
}
