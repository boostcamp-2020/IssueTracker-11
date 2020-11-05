//
//  IssueCollectionViewCell.swift
//  IssueTracker
//
//  Created by 양어진 on 2020/11/03.
//  Copyright © 2020 양어진. All rights reserved.
//

import UIKit

final class IssueCollectionViewCell: SwipeableCollectionViewCell {
    
    public static let identifier = String(describing: IssueCollectionViewCell.self)
    
    var issueContentView = IssueContentView()
    
    var isEditing: Bool = false {
        didSet {
            UIView.animate(withDuration: 0.3) {
                self.issueContentView.checkView.isHidden = !self.isEditing
            }
            scrollView.isScrollEnabled = !isEditing
        }
    }
    
    override var isSelected: Bool {
        didSet {
            issueContentView.checkImageView.image
            = isSelected ? UIImage(systemName: "checkmark.circle.fill") : UIImage(systemName: "circle")
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSubviews()
    }
    
    func configure(isEditing: Bool) {
        self.isEditing = isEditing
    }
    
    private func setupSubviews() {
        
        visibleContainerView.backgroundColor = .white
        
        visibleContainerView.addSubview(issueContentView)
        issueContentView.pinEdgesToSuperView()
        
        let deleteView = createLabelView(text: "Delete", textColor: .white, backgroundColor: .systemRed)
        rightHiddenContainerView.addSubview(deleteView)
        deleteView.pinEdgesToSuperView()
        
        let closeView = createLabelView(text: "Close", textColor: .white, backgroundColor: .systemGreen)
        leftHiddenContainerView.addSubview(closeView)
        closeView.pinEdgesToSuperView()
    }
    
    private func createLabelView(text: String, textColor: UIColor, backgroundColor: UIColor) -> UIView {
        let contentLabel: UILabel = {
            let label = UILabel()
            label.text = text
            label.textColor = textColor
            label.font = label.font.withSize(16)
            return label
        }()
        
        let view = UIView()
        view.backgroundColor = backgroundColor
        view.addSubview(contentLabel)
        
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            contentLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        return view
    }
    
}
