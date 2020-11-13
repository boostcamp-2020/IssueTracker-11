//
//  BorderLabel.swift
//  IssueTracker
//
//  Created by 김근수 on 2020/11/02.
//  Copyright © 2020 김근수. All rights reserved.
//

import UIKit

@IBDesignable
class BadgeLabel: UILabel {
    
    @IBInspectable
    public var topInset: CGFloat = 3.0
    
    @IBInspectable
    public var bottomInset: CGFloat = 3.0
    
    @IBInspectable
    public var leftInset: CGFloat = 7.0
    
    @IBInspectable
    public var rightInset: CGFloat = 7.0
    
    @IBInspectable
    public var borderColor: UIColor? {
        get { if let color = layer.borderColor { return UIColor(cgColor: color) }
            return nil
        }
        set { layer.borderColor = newValue?.cgColor }
    }
    
    @IBInspectable
    public var borderWidth: CGFloat {
        get { return layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    
    @IBInspectable
    public var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }
    
    override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.height += topInset + bottomInset
        contentSize.width += leftInset + rightInset
        return contentSize
    }
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset,
                                  left: leftInset,
                                  bottom: bottomInset,
                                  right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }
    
}
