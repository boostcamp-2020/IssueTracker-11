//
//  IssueCollectionViewCell.swift
//  IssueTracker
//
//  Created by 양어진 on 2020/11/03.
//  Copyright © 2020 양어진. All rights reserved.
//

import UIKit

final class IssueCollectionViewCell: SwipeableCollectionViewCell {
    
    // MARK: - Properties
    
    public static let identifier = String(describing: IssueCollectionViewCell.self)
    private var issueContentView = IssueContentView()
    
    var isEditing: Bool = false {
        didSet {
            self.issueContentView.checkView.isHidden = !self.isEditing
            scrollView.isScrollEnabled = !isEditing
        }
    }
    
    override var isSelected: Bool {
        didSet {
            issueContentView.checkImageView.image
                = isSelected ? UIImage(systemName: "checkmark.circle.fill") : UIImage(systemName: "circle")
        }
    }
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSubviews()
    }
    
    // MARK: - Methods
    
    func configure(issue: Issue, isEditing: Bool) {
        self.isEditing = isEditing
        issueContentView.titleLabel.text = issue.title
        issueContentView.contentLabel.text = issue.contents
        issueContentView.milestoneLabel.text = issue.milestone?.title
        issueContentView.issueLabelLabel.text = issue.labels?.first?.name
        
        issueContentView.milestoneLabel.isHidden = ((issue.milestone?.title?.isEmpty) == nil)
        issueContentView.issueLabelLabel.isHidden = ((issue.labels?.first?.name?.isEmpty) == nil)
    }
    
    private func setupSubviews() {
        visibleContainerView.backgroundColor = .white
        let deleteView = createLabelView(text: "Delete",
                                         textColor: .white,
                                         backgroundColor: .systemRed)
        let closeView = createLabelView(text: "Close",
                                        textColor: .white,
                                        backgroundColor: .systemGreen)
        
        visibleContainerView.addSubview(issueContentView)
        rightHiddenContainerView.addSubview(deleteView)
        leftHiddenContainerView.addSubview(closeView)
        
        issueContentView.pinEdgesToSuperView()
        deleteView.pinEdgesToSuperView()
        closeView.pinEdgesToSuperView()
    }
    
    private func createLabelView(text: String,
                                 textColor: UIColor,
                                 backgroundColor: UIColor) -> UIView {
        
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
