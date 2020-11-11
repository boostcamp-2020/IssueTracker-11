//
//  InfoHeaderView.swift
//  IssueTracker
//
//  Created by 김근수 on 2020/11/11.
//  Copyright © 2020 김근수. All rights reserved.
//

import UIKit

class InfoHeaderView: UICollectionReusableView {
    static let reuseIdentifier = "header-reuse-identifier"
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    
    func configure(title: String, selector: Selector) {
        titleLabel.text = title
        editButton.addTarget(self,
                             action: selector,
                             for: .touchUpInside)
    }
}
