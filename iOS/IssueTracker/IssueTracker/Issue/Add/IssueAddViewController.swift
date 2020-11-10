//
//  IssueAddViewController.swift
//  IssueTracker
//
//  Created by 양어진 on 2020/11/05.
//  Copyright © 2020 김근수. All rights reserved.
//

import UIKit
import MarkdownView

final class IssueAddViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var titleTextField: UITextField!
    @IBOutlet private weak var segmentedControl: UISegmentedControl!
    @IBOutlet private weak var contentTextView: ContentTextView!
    
    // MARK: - Properties
    
    private let imagePicker = UIImagePickerController()
    private var markdownPreview: MarkdownView? {
        willSet {
            guard let markdownPreview = newValue else { return }
            view.addSubview(markdownPreview)
            markdownPreview.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                markdownPreview.topAnchor.constraint(equalTo: contentTextView.topAnchor),
                markdownPreview.bottomAnchor.constraint(equalTo: contentTextView.bottomAnchor),
                markdownPreview.leadingAnchor.constraint(equalTo: contentTextView.leadingAnchor),
                markdownPreview.trailingAnchor.constraint(equalTo: contentTextView.trailingAnchor)
            ])
        }
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentTextView.photoDelegate = self
        imagePicker.delegate = self
        setSegmentedControl()
    }
    
    // MARK: - IBActions
    
    @IBAction func cancelButtonDidTap(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func uploadButtonDidTap(_ sender: UIBarButtonItem) {
        createIssue()
    }
    
    // MARK: - Methods
    
    private func createIssue() {
        guard
            let title = titleTextField.text,
            let contents = contentTextView.text
            else { return }
        
        let issue = Issue(id: nil,
                          title: title,
                          contents: contents,
                          status: nil,
                          author: nil,
                          authorID: 1,
                          milestone: nil,
                          milestoneID: nil,
                          assignees: [],
                          labels: [])
        
        let issueeDidCreate = Notification.Name("IssueeDidCreate")
        IssueService.shared.create(issue: issue) { [weak self] in
            NotificationCenter.default.post(name: issueeDidCreate,
                                            object: issue,
                                            userInfo: nil)
            self?.dismiss(animated: true, completion: nil)
        }
    }
    
    private func setSegmentedControl() {
        segmentedControl.addTarget(self,
                                   action: #selector(segmentedControlDidTap(_:)),
                                   for: .valueChanged)
    }
    
    private func renderStringToMarkdown() {
        markdownPreview = MarkdownView()
        guard
            let markdownPreview = markdownPreview,
            let text = contentTextView.text
            else { return }
        if text == contentTextView.placeholderText { return }
        markdownPreview.load(markdown: text)
    }
    
    // MARK: - Objc
    
    @objc private func segmentedControlDidTap(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            contentTextView.alpha = 1
            markdownPreview?.removeFromSuperview()
            markdownPreview = nil
        case 1:
            self.view.endEditing(true)
            contentTextView.alpha = 0
            renderStringToMarkdown()
        default:
            break
        }
    }
    
}

extension IssueAddViewController: InsertPhotoDelegate {
    
    func showPhotoPicker() {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true)
    }
    
}

extension IssueAddViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        
        guard let newImage = info[.originalImage] as? UIImage else { return }
        
        dismiss(animated: true) { [weak self] in
            self?.contentTextView.text = "\(newImage)"
        }
    }
    
}
