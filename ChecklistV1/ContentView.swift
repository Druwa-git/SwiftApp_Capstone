//
//  ContentView.swift
//  ChecklistV1
//
//  Created by 황동준 on 2021/05/30.
//  Copyright © 2021 황동준. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var checklistItems = ["Do Capstone Design 1 Homework", "Wash dishes", "Do Capstone Design 2 Homework", "Watch Lecture 11", "Hang Out With Girlfriends", "Watch Lecture 12"]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(checklistItems, id: \.self){
                    item in Text(item)
                        .onTapGesture {
                            self.checklistItems.append(item)
                            self.printChecklistContents() }
                }
            } // end of List
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
} //contentview end

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
