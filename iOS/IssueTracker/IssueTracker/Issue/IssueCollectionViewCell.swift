//
//  IssueCollectionViewCell.swift
//  IssueTracker
//
//  Created by 양어진 on 2020/11/03.
//  Copyright © 2020 양어진. All rights reserved.
//

import UIKit

final class IssueCollectionViewCell: SwipeableCollectionViewCell {
    
    var issueContentView = IssueContentView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSubviews()
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
