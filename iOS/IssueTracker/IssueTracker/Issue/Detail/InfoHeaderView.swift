//
//  InfoHeaderView.swift
//  IssueTracker
//
//  Created by 김근수 on 2020/11/11.
//  Copyright © 2020 김근수. All rights reserved.
//

import UIKit

final class InfoHeaderView: UICollectionReusableView {
    
    static let reuseIdentifier = "header-reuse-identifier"
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var editButton: UIButton!
    
    func configure(title: String, selector: Selector, target: Any?) {
        titleLabel.text = title
        editButton.addTarget(target,
                             action: selector,
                             for: .touchUpInside)
    }
}
