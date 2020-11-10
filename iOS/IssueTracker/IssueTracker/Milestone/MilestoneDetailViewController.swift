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
    
    @IBOutlet weak var dueDateLabel: UILabel!
    // MARK: - Properties
    
    var milestone: Milestone?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureActions()
    }
    
    // MARK: - Methods
    
    private func configure() {
        self.navigationItem.title = "마일스톤 편집"
        titleTextField.text = milestone?.title
        dueDateTextField.text = milestone?.dueDate?.toFormattedDate
        descriptionTextField.text = milestone?.description
    }
    
    private func configureActions() {
        dueDateTextField.addTarget(self,
        action: #selector(validateDateFormat),
        for: .editingChanged)
    }
    
    private func updateMilestone() {
        guard
            let id = milestone?.id,
            let title = titleTextField.text,
            let description = descriptionTextField.text
            else { return }
        
        let dueDate = dueDateTextField.text
        if dueDate != nil && !(dueDate?.isValidDate ?? false) { return }
        
        let milestone = Milestone(id: id,
                                  title: title,
                                  dueDate: dueDate,
                                  description: description,
                                  openNumber: self.milestone?.openNumber,
                                  closedNumber: self.milestone?.closedNumber)
        MilestoneService.shared.update(milestone: milestone) { [weak self] in
            NotificationCenter.default.post(Notification(name: .milestoneDidUpdate,
                                                         object: milestone,
                                                         userInfo: nil))
            self?.navigationController?.popViewController(animated: true)
        }
    }
    
    private func deleteMilestone() {
        guard let id = milestone?.id else { return }
        MilestoneService.shared.delete(id: id) { [weak self] in
            NotificationCenter.default.post(Notification(name: .milestoneDidDelete,
                                                         object: nil,
                                                         userInfo: ["id": id]))
            self?.navigationController?.popViewController(animated: true)
        }
    }
    
    @objc private func validateDateFormat() {
        let targetString = dueDateTextField.text ?? ""
        dueDateLabel.textColor = targetString.isValidDate ? .black : .red
    }
    
    // MARK: - IBAction
    
    @IBAction func saveButtonDidTap(_ sender: UIButton) {
        updateMilestone()
    }
    
    @IBAction func deleteButtonDidTap(_ sender: UIButton) {
        deleteMilestone()
    }
}
