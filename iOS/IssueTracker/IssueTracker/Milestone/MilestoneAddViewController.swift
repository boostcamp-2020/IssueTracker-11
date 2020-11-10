//
//  MilestoneAddViewController.swift
//  IssueTracker
//
//  Created by 김근수 on 2020/11/02.
//  Copyright © 2020 김근수. All rights reserved.
//

import UIKit

protocol MilestoneAddViewDelegate: class {
    func milestoneDidAdd(milestone: Milestone)
}

final class MilestoneAddViewController: UIViewController {
    
    // MARK: - Properties
    
    private let creationFormView = CreationFormView()
    private let backgroundView = UIView()
    weak var delegate: MilestoneAddViewDelegate?
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        creationFormView.delegate = self
        configureBackgroundView()
        configureCreationFormViewLayout()
        configureGestureRecognizer()
        
        creationFormView.secondInputTextField.addTarget(self,
                                                        action: #selector(validateDateFormat),
                                                        for: .editingChanged)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Methods
    
    private func configureCreationFormViewLayout() {
        self.view.addSubview(creationFormView)
        self.view.backgroundColor = UIColor(white: 0, alpha: 0.3)
        creationFormView.creationFormType = .milestone
        creationFormView.configureViewStyle()
        configureCreationFormViewConstraints()
    }
    
    private func configureCreationFormViewConstraints() {
        creationFormView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            creationFormView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            creationFormView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            creationFormView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16)
        ])
    }
    
    private func configureBackgroundView() {
        self.view.addSubview(backgroundView)
        backgroundView.backgroundColor = .clear
        configureBackGroundViewConstraints()
    }
    
    private func configureBackGroundViewConstraints() {
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
            backgroundView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            backgroundView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            backgroundView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0)
        ])
    }
    
    private func configureGestureRecognizer() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissView))
        backgroundView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    private func createMilestone() {
        guard
            let title = creationFormView.firstInputTextField.text,
            let description = creationFormView.thirdInputTextField.text
            else { return }
        
        let dueDate = creationFormView.secondInputTextField.text
        if dueDate != nil && !(dueDate?.isValidDate ?? false) { return }
        
        let milestone = Milestone(id: nil,
                                  title: title,
                                  dueDate: dueDate,
                                  description: description,
                                  openNumber: nil,
                                  closedNumber: nil)
        MilestoneService.shared.create(milestone: milestone) { [weak self] in
            self?.delegate?.milestoneDidAdd(milestone: milestone)
            self?.dismiss(animated: true, completion: nil)
        }
    }
    
    @objc private func dismissView() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func validateDateFormat() {
        let targetString = creationFormView.secondInputTextField.text ?? ""
        creationFormView.titleLabels[1].textColor = targetString.isValidDate ? .black : .red
    }
        
}

extension MilestoneAddViewController: CreationFormViewDelegate {
    
    func cancelButtonDidTap() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func resetButtonDidTap() {
        creationFormView.inputTextFields.forEach { $0.text = "" }
    }
    
    func saveButtonDidTap() {
        createMilestone()
    }
    
}
