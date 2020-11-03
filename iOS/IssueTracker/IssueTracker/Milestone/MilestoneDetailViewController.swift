//
//  MilestoneDetailViewController.swift
//  IssueTracker
//
//  Created by 김근수 on 2020/11/02.
//  Copyright © 2020 김근수. All rights reserved.
//

import UIKit

final class MilestoneDetailViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet private weak var titleTextField: UITextField!
    @IBOutlet private weak var dueDateTextField: UITextField!
    @IBOutlet private weak var descriptionTextField: UITextField!
    
    // MARK: - Properties
    
    var milestone: Milestone?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        self.navigationItem.title = "마일스톤 편집"
        titleTextField.text = milestone?.title
        dueDateTextField.text = milestone?.dueDate
        descriptionTextField.text = milestone?.description
    }
}
