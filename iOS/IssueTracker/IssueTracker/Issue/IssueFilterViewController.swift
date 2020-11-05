//
//  IssueFilterViewController.swift
//  IssueTracker
//
//  Created by 김근수 on 2020/11/04.
//  Copyright © 2020 김근수. All rights reserved.
//

import UIKit

class IssueFilterViewController: UIViewController {

    @IBOutlet weak var filterTableView: UITableView!
    
    let filterDataSource = FilterDataSource()
    let plainOptions = PlainFilterOption.allCases
    let detailOptions = DetailFilterOption.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureDataSource()
    }
    
    private func configureDataSource() {
        filterDataSource.plainFilterOptions = plainOptions
        filterDataSource.detailFilterOptions = detailOptions
        filterTableView.dataSource = filterDataSource
    }
    
    @IBAction func cancelButtonDidTap(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonDidTap(_ sender: UIBarButtonItem) {
    }
    
}

extension IssueFilterViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("dd")
    }
}
