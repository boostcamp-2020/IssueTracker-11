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

    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        creationFormView.delegate = self
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

// MARK: - CreationFormViewDelegate

extension LabelAddViewController: CreationFormViewDelegate {
    
    func cancelButtonDidTap() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func resetButtonDidTap() {
        creationFormView.firstInputTextField.text = ""
        creationFormView.secondInputTextField.text = ""
        creationFormView.thirdInputTextField.text = ""
    }
    
    func saveButtonDidTap() {
        print("save")
    }
    
    func colorChangeButtonDidTap() {
        print("color~")
    }
    
}
