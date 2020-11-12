//
//  LabelCell.swift
//  IssueTracker
//
//  Created by 김근수 on 2020/11/11.
//  Copyright © 2020 김근수. All rights reserved.
//

import UIKit

final class LabelCell: UICollectionViewCell {
    
    static let reuseIdentifier = "LabelCell"
    
    @IBOutlet private weak var label: BadgeLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        label.layer.masksToBounds = true
    }
    
    func configure(content: Label?) {
        label.text = content?.name
        
        guard let colorString = content?.color else { return }
        let color = UIColor(hex: colorString)
        label.backgroundColor = color
        label.textColor = color.isDarkColor ? .white : .black
    }
    
}
