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
}
