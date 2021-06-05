//
//  ChecklistItem.swift
//  ChecklistV1
//
//  Created by 황동준 on 2021/06/06.
//  Copyright © 2021 황동준. All rights reserved.
//

import Foundation

struct ChecklistItem: Identifiable {
    let id = UUID()
    var name: String
    var isChecked: Bool = false
}
