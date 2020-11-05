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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentTextView.photoDelegate = self
    }
    
}

extension IssueAddViewController: InsertPhotoDelegate {
    
    func photoToURL() {
        print("didTappppzz")
    }
    
}
