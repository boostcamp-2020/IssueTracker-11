//
//  MilestoneCell.swift
//  IssueTracker
//
//  Created by 김근수 on 2020/11/02.
//  Copyright © 2020 김근수. All rights reserved.
//

import UIKit

final class MilestoneCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var titleLabel: BadgeLabel!
    @IBOutlet private weak var dueDateLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var openLabel: UILabel!
    @IBOutlet private weak var closedLabel: UILabel!
    @IBOutlet private weak var percentLabel: UILabel!
    
    public static let identifier = "MilestoneCollectionViewCell"
    
    func configure(with item: Milestone) {
        titleLabel.text = item.title
        dueDateLabel.text = item.dueDate?.toFormattedDate
        descriptionLabel.text = item.description
        openLabel.text = "\(item.openNumber ?? 0) open"
        closedLabel.text = "\(item.closedNumber ?? 0) closed"
        percentLabel.text = "\(item.progressPercentage)%"
    }
    
}
