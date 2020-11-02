//
//  CreationFormView.swift
//  IssueTracker
//
//  Created by 김근수 on 2020/10/29.
//  Copyright © 2020 김근수. All rights reserved.
//

import UIKit

protocol CreationFormViewDelegate: class {
    func cancelButtonDidTap()
    func resetButtonDidTap()
    func saveButtonDidTap()
    func colorChangeButtonDidTap()
}

extension CreationFormViewDelegate {
    func colorChangeButtonDidTap() { }
}

final class CreationFormView: UIView {

    // MARK: - IBOutlets
    
    @IBOutlet var titleLabels: [UILabel]! {
        didSet { titleLabels.sort { $0.tag < $1.tag } }
    }
    
    @IBOutlet var inputTextFields: [UITextField]! {
        didSet { inputTextFields.sort { $0.tag < $1.tag } }
    }
    
    @IBOutlet weak var colorSettingView: UIView!
    @IBOutlet weak var colorSampleView: UIView!
    
    // MARK: - Properties
    
    weak var delegate: CreationFormViewDelegate?
    
    var creationFormType: CreationFormType = .label
    
    var firstInputTextField: UITextField! { return inputTextFields[0] }
    
    var secondInputTextField: UITextField! { return inputTextFields[1] }
    
    var thirdInputTextField: UITextField! { return inputTextFields[2] }
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: - IBActions
    
    @IBAction func cancelButtonDidTap(_ sender: UIButton) {
        delegate?.cancelButtonDidTap()
    }

    @IBAction func resetButtonDidTap(_ sender: UIButton) {
        delegate?.resetButtonDidTap()
    }

    @IBAction func saveButtonDidTap(_ sender: UIButton) {
        delegate?.saveButtonDidTap()
    }
    
    @IBAction func colorChangeButtonDidTap(_ sender: UIButton) {
        delegate?.colorChangeButtonDidTap()
    }
    
    // MARK: - Methods
    
    private func setup() {
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = true
        
        let name = String(describing: CreationFormView.self)
        guard let view = Bundle.main.loadNibNamed(name, owner: self, options: nil)?.first as? UIView  else { return }
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(view)
    }
    
    public func configureViewStyle() {
        colorSettingView.isHidden = creationFormType == .milestone
        secondInputTextField.placeholder = creationFormType == .milestone ? "yyyy-dd-mm(선택)" : ""
        configureFormTitles()
    }
    
    private func configureFormTitles() {
        let titles = creationFormType.formTitles
        zip(titleLabels, titles).forEach { $0.text = $1 }
    }
    
}
