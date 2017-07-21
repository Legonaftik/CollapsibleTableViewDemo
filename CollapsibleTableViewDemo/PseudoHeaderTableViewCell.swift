//
//  PseudoHeaderTableViewCell.swift
//  CollapsibleTableViewDemo
//
//  Created by Vladimir Pavlov on 21/07/2017.
//  Copyright © 2017 Vladimir Pavlov. All rights reserved.
//

import UIKit

class PseudoHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var statusButton: UIButton!

    func setExpanded() {
        statusButton.setImage(#imageLiteral(resourceName: "arw_red_top"), for: .normal)
    }

    func setCollapsed() {
        statusButton.setImage(#imageLiteral(resourceName: "arw_red_bottom"), for: .normal)
    }
}
