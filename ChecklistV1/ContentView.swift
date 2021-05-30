//
//  ContentView.swift
//  ChecklistV1
//
//  Created by 황동준 on 2021/05/30.
//  Copyright © 2021 황동준. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section (header: Text("High priority")){
                    Group {
                        Text("Do Capstone Design 1 Homework")
                        Text("Wash dishes")
                        Text("Do Capstone Design 2 Homework")
                        Text("Watch Lecture 11")
                        Text("Hang Out With Girlfriends")
                        Text("Watch Lecture 12")
                    }
                    Group {
                        Text("Clean my room")
                        Text("Study Machine Learning")
                        Text("Call my friends")
                        Text("Eat Dinner")
                        Text("Watch Lecture 13")
                    }
                }
                Section(header: Text("Low priority")){
                    Text("Exercise (inline skate)")
                    Text("Watch Moives")
                }
            } // end of List
            .listStyle(GroupedListStyle())
            .navigationBarTitle("CheckList")
        } //navigation end
    } //body end
} //contentview end

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
