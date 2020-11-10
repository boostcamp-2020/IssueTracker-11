//
//  IssueAddViewController.swift
//  IssueTracker
//
//  Created by 양어진 on 2020/11/05.
//  Copyright © 2020 김근수. All rights reserved.
//

import UIKit

final class IssueAddViewController: UIViewController {
    
    @IBOutlet private weak var titleTextField: UITextField!
    @IBOutlet private weak var segmentedControl: UISegmentedControl!
    @IBOutlet private weak var contentTextView: ContentTextView!
    
    private let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentTextView.photoDelegate = self
        imagePicker.delegate = self
    }
    
    @IBAction func cancelButtonDidTap(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func uploadButtonDidTap(_ sender: UIBarButtonItem) {
        createIssue()
    }
    
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
