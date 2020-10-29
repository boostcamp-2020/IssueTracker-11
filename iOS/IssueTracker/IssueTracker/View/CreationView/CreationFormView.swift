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
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var thirdTextField: UITextField!
    @IBOutlet weak var colorSettingView: UIView!
    @IBOutlet weak var colorSampleView: UIView!
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    // MARK: - Properties
    
    weak var delegate: CreationFormViewDelegate?
    
    var creationFormType: CreationFormType = .label {
        didSet { configureThirdView() }
    }
    
    var firstLabelName: String? {
        get { return firstLabel.text }
        set { firstLabel.text = newValue }
    }
    
    var secondLabelName: String? {
        get { return secondLabel.text }
        set { secondLabel.text = newValue }
    }
    
    var thirdLabelName: String? {
        get { return thirdLabel.text }
        set { thirdLabel.text = newValue }
    }
    
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
        let name = String(describing: CreationFormView.self)
        guard let view = Bundle.main.loadNibNamed(name, owner: self, options: nil)?.first as? UIView  else { return }
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = true
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(view)
    }
    
    private func configureThirdView() {
        if creationFormType == .milestone {
            colorSettingView.isHidden = true
        }
    }
    
}

extension CreationFormView {
    
    enum CreationFormType {
        case label
        case milestone
    }
    
}
