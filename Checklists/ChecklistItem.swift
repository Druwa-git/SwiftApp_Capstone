//
//  ChecklistItem.swift
//  Checklists
//
//  Created by 황동준 on 2021/06/12.
//  Copyright © 2021 황동준. All rights reserved.
//

import Foundation

class ChecklistItem {
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
}
