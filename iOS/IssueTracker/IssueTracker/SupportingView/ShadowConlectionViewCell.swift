//
//  ShadowConlectionViewCell.swift
//  IssueTracker
//
//  Created by 김근수 on 2020/11/11.
//  Copyright © 2020 김근수. All rights reserved.
//

import UIKit

class ShadowConlectionViewCell: UICollectionViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.layer.cornerRadius = 5
        self.contentView.layer.borderWidth = 1
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 5.0
        self.layer.shadowOpacity = 0.6
        self.layer.cornerRadius = 10.0
        self.layer.masksToBounds = false
    }
    
}
