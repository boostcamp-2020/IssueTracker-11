//
//  FilterDetailViewController.swift
//  IssueTracker
//
//  Created by 김근수 on 2020/11/05.
//  Copyright © 2020 김근수. All rights reserved.
//

import UIKit

final class FilterDetailViewController: UIViewController {
    
    var navigationBarTitle: String?
    
    override func viewDidLoad() {
        navigationItem.title = navigationBarTitle
        super.viewDidLoad()
    }

}
