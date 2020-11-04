//
//  CircleButton.swift
//  IssueTracker
//
//  Created by 김근수 on 2020/11/04.
//  Copyright © 2020 김근수. All rights reserved.
//

import UIKit

@IBDesignable
class CircleButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    override func prepareForInterfaceBuilder() {
        configure()
    }
    
    private func configure() {
        let radius = bounds.width / 2
        layer.cornerRadius = radius
        layer.masksToBounds = true
        contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
}
