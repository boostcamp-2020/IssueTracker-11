//
//  LabelAddViewController.swift
//  IssueTracker
//
//  Created by 양어진 on 2020/11/02.
//  Copyright © 2020 양어진. All rights reserved.
//

import UIKit

final class LabelAddViewController: UIViewController {
    
    // MARK: - Properties
    
    private let creationFormView = CreationFormView()
    private let backgroundView = UIView()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        creationFormView.delegate = self
        configureBackgroundView()
        configure()
        configureGestureRecognizer()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Methods
    
    private func configure() {
        self.view.addSubview(creationFormView)
        self.view.backgroundColor = UIColor(white: 0, alpha: 0.3)
        creationFormView.creationFormType = .label
        creationFormView.configureViewStyle()
        configureCreationFormViewConstraints()
        configureRandomColor()
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
        backgroundView.pinEdgesToSuperView()
    }
    
    private func configureGestureRecognizer() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        backgroundView.addGestureRecognizer(tapGestureRecognizer)
        creationFormView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    private func configureRandomColor() {
        let color = UIColor().random
        creationFormView.colorSampleView.backgroundColor = color
        creationFormView.thirdInputTextField.text = color.toHexString()
    }
    
    private func createLabel() {
        let name = creationFormView.firstInputTextField.text
        let description = creationFormView.secondInputTextField.text
        let color = creationFormView.thirdInputTextField.text
        
        let label = Label(id: nil, name: name, description: description, color: color)
        LabelService.shared.createLabel(label: label) { [weak self] in
            NotificationCenter.default.post(Notification(name: .labelDidCreate,
                                                         object: label,
                                                         userInfo: nil))
            self?.dismiss(animated: true, completion: nil)
        }
    }
    
    @objc private func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
}

// MARK: - CreationFormViewDelegate

extension LabelAddViewController: CreationFormViewDelegate {
    
    func cancelButtonDidTap() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func resetButtonDidTap() {
        creationFormView.inputTextFields.forEach { $0.text = "" }
        configureRandomColor()
    }
    
    func saveButtonDidTap() {
        createLabel()
    }
    
    func colorChangeButtonDidTap() {
        configureRandomColor()
    }
    
}
