//
//  LabelCollectionViewCell.swift
//  IssueTracker
//
//  Created by 양어진 on 2020/11/02.
//  Copyright © 2020 양어진. All rights reserved.
//

import UIKit

final class LabelCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlet
    
    @IBOutlet private weak var nameLabel: BadgeLabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    // MARK: - Method
    
    func configure(content: Label) {
        nameLabel.text = content.name
        descriptionLabel.text = content.description
        
        guard let colorString = content.color else { return }
        let color = UIColor(hex: colorString)
        nameLabel.backgroundColor = color
        nameLabel.textColor = color.isDarkColor ? .white : .black
    }
    
}
