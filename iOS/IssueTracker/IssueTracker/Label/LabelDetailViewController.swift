//
//  LabelDetailViewController.swift
//  IssueTracker
//
//  Created by 양어진 on 2020/11/02.
//  Copyright © 2020 양어진. All rights reserved.
//

import UIKit

final class LabelDetailViewController: UIViewController {

    // MARK: - IBOutlet
    
    @IBOutlet private weak var titleTextField: UITextField!
    @IBOutlet private weak var descriptionTextField: UITextField!
    @IBOutlet private weak var colorTextField: UITextField!
    @IBOutlet private weak var colorSampleView: UIView!
    
    // MARK: - Properties
    
    var label: Label?
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    // MARK: - IBAction
    
    @IBAction private func colorRandomButtonDidTap(_ sender: UIButton) {
    }
    
    @IBAction private func saveButtonDidTap(_ sender: UIButton) {
    }
    
    @IBAction private func deleteButtonDidTap(_ sender: UIButton) {
    }
    
    // MARK: - Methods
    
    private func configure() {
        self.navigationItem.title = "레이블 편집"
        guard let label = label else { return }
        titleTextField.text = label.type
        descriptionTextField.text = label.title
    }
    
}
