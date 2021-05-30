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
        List {
            Text("My name is")
            Text("Hwang Dong Jun")
            Text("everyone please")
            Text("make a noise")
            Text("yeah!!!")
        } // end of List
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
