//
//  CommentCollectionViewCell.swift
//  IssueTracker
//
//  Created by 양어진 on 2020/11/04.
//  Copyright © 2020 김근수. All rights reserved.
//

import UIKit

final class CommentCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var optionButton: UIButton!
    @IBOutlet private weak var likeButton: UIButton!
    @IBOutlet private weak var userImageView: UIImageView!
    @IBOutlet private weak var userNameLabel: UILabel!
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var contentLabel: UILabel!
    
    func conigure(text: String) {
        contentLabel.text = text
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        
        setNeedsLayout()
        layoutIfNeeded()
        
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        var frame = layoutAttributes.frame
        frame.size.height = ceil(size.height)
        layoutAttributes.frame = frame
        
        return layoutAttributes
    }
    
}
