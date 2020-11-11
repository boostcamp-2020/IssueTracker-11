//
//  CloseButtonCell.swift
//  IssueTracker
//
//  Created by 김근수 on 2020/11/11.
//  Copyright © 2020 김근수. All rights reserved.
//

import UIKit

final class CloseButtonCell: ShadowCollectionViewCell {
    
    static let reuseIdentifier = "CloseButtonCell"
    
    @IBOutlet private weak var closeButton: UIButton!
    
    func configure(selector: Selector) {
        closeButton.addTarget(self,
                              action: selector,
                              for: .touchUpInside)
    }
}
