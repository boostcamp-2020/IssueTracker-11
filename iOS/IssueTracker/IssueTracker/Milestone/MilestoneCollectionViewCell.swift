//
//  MilestoneCell.swift
//  IssueTracker
//
//  Created by 김근수 on 2020/11/02.
//  Copyright © 2020 김근수. All rights reserved.
//

import UIKit

class MilestoneCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: BorderLabel!
    @IBOutlet weak var dueDateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var openLabel: UILabel!
    @IBOutlet weak var closedLabel: UILabel!
    @IBOutlet weak var percentLabel: UILabel!
    
    public static let identifier = "MilestoneCollectionViewCell"
    
    func configure(with item: Milestone) {
        titleLabel.text = item.title
        dueDateLabel.text = item.dueDate
        descriptionLabel.text = item.description
        openLabel.text = "\(item.openNumber) open"
        closedLabel.text = "\(item.closedNumber) closed"
        percentLabel.text = "\(item.progressPercentage)%"
    }
    
}
