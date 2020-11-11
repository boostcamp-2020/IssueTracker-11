//
//  MilestoneView.swift
//  IssueTracker
//
//  Created by 김근수 on 2020/11/09.
//  Copyright © 2020 김근수. All rights reserved.
//

import UIKit

class MilestoneCell: ShadowConlectionViewCell {
    
    static let reuseIdentifier = "MilestoneCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(title: String, progress: Float) {
        titleLabel.text = title
        progressView.progress = progress
    }
}
