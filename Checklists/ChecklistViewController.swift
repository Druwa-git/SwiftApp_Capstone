//
//  ViewController.swift
//  Checklists
//
//  Created by 황동준 on 2021/06/12.
//  Copyright © 2021 황동준. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
    var items = [ChecklistItem]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let item1 = ChecklistItem()
        item1.text = "Walk the dog"
        items.append(item1)
        
        let item2 = ChecklistItem()
        item2.text = "Study Capstone design"
        item2.checked = true
        items.append(item2)
        
        let item3 = ChecklistItem()
        item3.text = "Play Computer game"
        items.append(item3)
        
        let item4 = ChecklistItem()
        item4.checked = true
        item4.text = "Sing a Song"
        items.append(item4)
        
        let item5 = ChecklistItem()
        item5.text = "Eat dinner"
        items.append(item5)
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int)->Int {
        return items.count
    }
    // MARK: - TABLE VIEW Data Source
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "ChecklistItem", for: indexPath)
            
            let item = items[indexPath.row]
            configureText(for: cell, with: item)
            configureCheckmark(for: cell, with: item)
            
            return cell
        }
    
    func configureCheckmark(for cell:UITableViewCell, with item: ChecklistItem){
        if item.checked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
    
    func configureText(for cell: UITableViewCell, with item: ChecklistItem) {
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
    
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            let item = items[indexPath.row]
            item.toggleChecked()
            configureCheckmark(for: cell, with: item)
        }//end of cell
            
        tableView.deselectRow(at: indexPath, animated: true)
    }//end of didSelectRow
}

