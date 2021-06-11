//
//  ViewController.swift
//  Checklists
//
//  Created by 황동준 on 2021/06/12.
//  Copyright © 2021 황동준. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int)->Int {
        return 100
    }
    // MARK: - TABLE VIEW Data Source
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "ChecklistItem", for: indexPath)
            
            let label = cell.viewWithTag(1000) as! UILabel
            
            if indexPath.row == 0{
                label.text = "Walk the dog"
            } else if indexPath.row % 5 == 1 {
                label.text = "Study Capstone design"
            } else if indexPath.row % 5 == 2 {
                label.text = "Play Computer game"
            } else if indexPath.row % 5 == 3 {
                label.text = "Sing a Song"
            } else if indexPath.row % 5 == 4 {
                label.text = "Eat dinner"
            }
            
            return cell
        }


}

