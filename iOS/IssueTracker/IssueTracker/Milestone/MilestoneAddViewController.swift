//
//  MilestoneAddViewController.swift
//  IssueTracker
//
//  Created by 김근수 on 2020/11/02.
//  Copyright © 2020 김근수. All rights reserved.
//

import UIKit

class MilestoneAddViewController: UIViewController {
    
    let creationFormView = CreationFormView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        self.view.addSubview(creationFormView)
        self.view.backgroundColor = UIColor(white: 0, alpha: 0.3)
        creationFormView.creationFormType = .milestone
        creationFormView.configureViewStyle()
        configureConstraints()
        
    }
    
    private func configureConstraints() {
        creationFormView.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
        creationFormView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        creationFormView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
        creationFormView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16)
      ])
    }
}
