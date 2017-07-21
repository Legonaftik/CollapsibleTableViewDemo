//
//  ViewController.swift
//  CollapsibleTableViewDemo
//
//  Created by Vladimir Pavlov on 21/07/2017.
//  Copyright © 2017 Vladimir Pavlov. All rights reserved.
//

import UIKit

class CollapsibleTableViewDemoVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let headerIdentifier = "headerCell"
    private let cellIdentifier = "contentCell"
    
    private let sectionTitles = ["First section", "Second section", "Third section"]
    private var sectionIsExpanded = [true, true, true]
    private let numberOfActualRowsForSection = 4
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // First will always be header
        return sectionIsExpanded[section] ? (1+numberOfActualRowsForSection) : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: headerIdentifier, for: indexPath) as! PseudoHeaderTableViewCell
            cell.titleLabel.text = sectionTitles[indexPath.section]
            
            if sectionIsExpanded[indexPath.section] {
                cell.setExpanded()
            } else {
                cell.setCollapsed()
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
            cell.textLabel?.text = "Section: \(indexPath.section); row \(indexPath.row)"
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Expand/hide the section if tapped its header
        if indexPath.row == 0 {
            sectionIsExpanded[indexPath.section] = !sectionIsExpanded[indexPath.section]
            
            tableView.reloadSections([indexPath.section], with: .automatic)
        }
    }
}
