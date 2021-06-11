//
//  Checklist.swift
//  ChecklistV1
//
//  Created by 황동준 on 2021/06/06.
//  Copyright © 2021 황동준. All rights reserved.
//

import Foundation

class Checklist: ObservableObject {
    //initialize
    init() {
        loadChecklistItems()
    }
    /*
    @Published var items = [
        ChecklistItem(name : "Do Capstone Design 1 Homework", isChecked: false),
        ChecklistItem(name : "Wash dishes", isChecked: false),
        ChecklistItem(name : "Do Capstone Design 2 Homework", isChecked: true),
        ChecklistItem(name : "Watch Lecture 11", isChecked: false),
        ChecklistItem(name : "Hang Out With Girlfriends", isChecked: true),
        ChecklistItem(name : "Watch Lecture 11", isChecked: true),
    ]
    */
    @Published var items: [ChecklistItem] = []
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
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let directory = paths[0]
        print("Documents directory is: \(directory)")
        return directory
    }
    func dataFilePath() -> URL {
        let filePath = documentsDirectory().appendingPathComponent("Checklist.plist")
        print("Data file path is: \(filePath)")
        return filePath
    }
    func saveChecklistItems() {
        print("Saving checklist items")
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(items)
            try data.write(to: dataFilePath(), options: Data.WritingOptions.atomic)
            print("Checklist items saved")
        } catch {
            print("Error encoding item array: \(error.localizedDescription)")
        }//end of try
    }//end of function
    
    //load file
    func loadChecklistItems() {
        print("Loading checklist items")
        let path = dataFilePath()
        if let data = try? Data(contentsOf: path) {
            let decoder = PropertyListDecoder()
            do {
                items = try decoder.decode([ChecklistItem].self, from:data)
                print("Checklist items loaded")
            } catch {
                print("Error decoding item array: \(error.localizedDescription)")
            }
        }
    }
}
