//
//  MilestoneAddViewController.swift
//  IssueTracker
//
//  Created by 김근수 on 2020/11/02.
//  Copyright © 2020 김근수. All rights reserved.
//

import UIKit

class MilestoneAddViewController: UIViewController {
    
    // MARK: - Properties
    
    let creationFormView = CreationFormView()
    let backgroundView = UIView()

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        creationFormView.delegate = self
        configureBackgroundView()
        configureCreationFormViewLayout()
        configureGestureRecognizer()
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
    
    @objc private func dismissView() {
        self.dismiss(animated: true, completion: nil)
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
        
    }
    
}
