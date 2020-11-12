//
//  CommentAddViewController.swift
//  IssueTracker
//
//  Created by 양어진 on 2020/11/12.
//  Copyright © 2020 양어진. All rights reserved.
//

import UIKit
import MarkdownView

final class CommentAddViewController: UIViewController {
    
    @IBOutlet private weak var segmentedControl: UISegmentedControl!
    @IBOutlet private weak var commentTextView: ContentTextView!
    
    var issueID: Int?
    
    private var markdownPreview: MarkdownView? {
        willSet {
            guard let markdownPreview = newValue else { return }
            view.addSubview(markdownPreview)
            markdownPreview.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                markdownPreview.topAnchor.constraint(equalTo: commentTextView.topAnchor),
                markdownPreview.bottomAnchor.constraint(equalTo: commentTextView.bottomAnchor),
                markdownPreview.leadingAnchor.constraint(equalTo: commentTextView.leadingAnchor),
                markdownPreview.trailingAnchor.constraint(equalTo: commentTextView.trailingAnchor)
            ])
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSegmentedControl()
    }

    @IBAction private func cancelButtonDidTap(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction private func uploadButtonDidTap(_ sender: UIBarButtonItem) {
        createComment()
    }
    
    private func createComment() {
        guard
            let contents = commentTextView.text,
            let issueID = issueID
            else { return }
        
        let comment = Comment(id: nil,
                              contents: contents,
                              issueID: issueID,
                              authorID: 1,
                              createdAt: nil,
                              updatedAt: nil)
        
        CommentService.shared.commentCreate(comment: comment) { [weak self] in
                self?.dismiss(animated: true, completion: nil)
        }
//        IssueService.shared.create(issue: issue) { [weak self] in
//            NotificationCenter.default.post(name: .issueDidCreate,
//                                            object: issue,
//                                            userInfo: nil)
//            self?.dismiss(animated: true, completion: nil)
//        }
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
               let text = commentTextView.text
               else { return }
           if text == commentTextView.placeholderText { return }
           markdownPreview.load(markdown: text)
       }
       
       // MARK: - Objc
       
       @objc private func segmentedControlDidTap(_ sender: UISegmentedControl) {
           switch sender.selectedSegmentIndex {
           case 0:
               commentTextView.alpha = 1
               markdownPreview?.removeFromSuperview()
               markdownPreview = nil
           case 1:
               self.view.endEditing(true)
               commentTextView.alpha = 0
               renderStringToMarkdown()
           default:
               break
           }
       }
    
}
