//
//  CommentHeaderReusableView.swift
//  IssueTracker
//
//  Created by 양어진 on 2020/11/04.
//  Copyright © 2020 김근수. All rights reserved.
//

import UIKit

final class CommentHeaderReusableView: UICollectionReusableView {
    
    @IBOutlet private weak var userImageView: UIImageView!
    @IBOutlet private weak var userNameLabel: UILabel!
    @IBOutlet private weak var issueNumberLabel: UILabel!
    @IBOutlet private weak var issueTitleLabel: UILabel!
    @IBOutlet private weak var issueStateLabel: BadgeLabel!
    
    func conigure(status: Bool) {
        setStatusLabel(status ? .open : .closed)
    }
    
    private func setStatusLabel(_ status: IssueStatus) {
        let attributedString = NSMutableAttributedString(string: "")
        
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = status.image
        attributedString.append(NSAttributedString(attachment: imageAttachment))
        attributedString.append(NSAttributedString(string: status.text))
        
        issueStateLabel.attributedText = attributedString
        issueStateLabel.backgroundColor = status.backgroundColor
        issueStateLabel.textColor = status.textColor
    }
    
}
