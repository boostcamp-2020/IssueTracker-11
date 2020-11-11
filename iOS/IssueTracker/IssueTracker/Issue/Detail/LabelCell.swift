//
//  LabelCell.swift
//  IssueTracker
//
//  Created by 김근수 on 2020/11/11.
//  Copyright © 2020 김근수. All rights reserved.
//

import UIKit

class LabelCell: UICollectionViewCell {
    static let reuseIdentifier = "LabelCell"
    @IBOutlet weak var label: BadgeLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        label.layer.masksToBounds = true
    }
    
    func configure(title: String) {
        label.text = title
    }
}
