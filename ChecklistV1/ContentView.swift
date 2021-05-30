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
                    Text(checklistItems[0])
                        .onTapGesture {
                            self.checklistItems[0] = "Take the Capstone 1 to the bed"
                        }
                    Text(checklistItems[1])
                    Text(checklistItems[2])
                    Text(checklistItems[3])
                    Text(checklistItems[4])
                    Text(checklistItems[5])
                    /*Text("Clean my room")
                    Text("Study Machine Learning")
                    Text("Call my friends")
                    Text("Eat Dinner")
                    Text("Watch Lecture 13")
                    Text("Exercise (inline skate)")
                    Text("Watch Moives")*/
            } // end of List
            .navigationBarTitle("CheckList")
        } //navigation end
    } //body end
} //contentview end

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
