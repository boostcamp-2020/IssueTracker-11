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
    
    @IBOutlet private weak var labelTypeLabel: UILabel!
    @IBOutlet private weak var labelTitleLabel: UILabel!
    
    // MARK: - Method
    
    func labelCollectionViewCellConfigure(content: Label) {
        labelTypeLabel.text = content.type
        labelTitleLabel.text = content.title
    }
    
}
