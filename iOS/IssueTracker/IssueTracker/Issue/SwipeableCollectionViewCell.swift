//
//  SwipeableCollectionViewCell.swift
//  IssueTracker
//
//  Created by 양어진 on 2020/11/03.
//  Copyright © 2020 김근수. All rights reserved.
//

import UIKit

protocol SwipeableCollectionViewCellDelegate: class {
    func visibleContainerViewTapped(inCell cell: UICollectionViewCell)
    func leftHiddenContainerViewTapped(inCell cell: UICollectionViewCell)
    func rightHiddenContainerViewTapped(inCell cell: UICollectionViewCell)
}

class SwipeableCollectionViewCell: UICollectionViewCell {
    
    // MARK: Properties
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces = scrollView.contentOffset.x > 0
        return scrollView
    }()
    
    let visibleContainerView = UIView()
    let leftHiddenContainerView = UIView()
    let rightHiddenContainerView = UIView()
    
    weak var delegate: SwipeableCollectionViewCellDelegate?
    
    // MARK: Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        setupGestureRecognizer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSubviews()
        setupGestureRecognizer()
    }
    
    private func setupSubviews() {
        let hiddenStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.distribution = .fillEqually
            stackView.addArrangedSubview(leftHiddenContainerView)
            stackView.addArrangedSubview(rightHiddenContainerView)
            return stackView
        }()
        
        let stackView: UIStackView = {
            let stackView = UIStackView()
            stackView.addArrangedSubview(visibleContainerView)
            stackView.addArrangedSubview(hiddenStackView)
            return stackView
        }()
        
        visibleContainerView.translatesAutoresizingMaskIntoConstraints = false
        visibleContainerView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        
        addSubview(scrollView)
        scrollView.pinEdgesToSuperView()
        
        scrollView.addSubview(stackView)
        stackView.pinEdgesToSuperView()
        
        stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor,
                                         multiplier: 1.35).isActive = true
    }
    
    private func setupGestureRecognizer() {
        let leftHiddenContainerRecognizer = UITapGestureRecognizer(target: self,
                                                                   action: #selector(leftHiddenContainerViewTapped))
        leftHiddenContainerView.addGestureRecognizer(leftHiddenContainerRecognizer)
        
        let rightHiddenContainerRecognizer = UITapGestureRecognizer(target: self,
                                                                    action: #selector(rightHiddenContainerViewTapped))
        rightHiddenContainerView.addGestureRecognizer(rightHiddenContainerRecognizer)
        
        let visibleContainerRecognizer = UITapGestureRecognizer(target: self,
                                                                action: #selector(visibleContainerViewTapped))
        visibleContainerView.addGestureRecognizer(visibleContainerRecognizer)
    }
    
    @objc private func visibleContainerViewTapped() {
        delegate?.visibleContainerViewTapped(inCell: self)
    }
    
    @objc private func leftHiddenContainerViewTapped() {
        delegate?.leftHiddenContainerViewTapped(inCell: self)
    }
    
    @objc private func rightHiddenContainerViewTapped() {
        delegate?.rightHiddenContainerViewTapped(inCell: self)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        if scrollView.contentOffset.x > 0 {
            UIView.animate(withDuration: 0.2) {
                self.scrollView.contentOffset.x = 0
            }
        }
    }
    
}
