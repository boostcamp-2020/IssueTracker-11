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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filterTableView.dataSource = self
    }
    
    @IBAction func cancelButtonDidTap(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonDidTap(_ sender: UIBarButtonItem) {
    }
    
}

extension IssueFilterViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title: String
        switch section {
        case 0:
            title = IssueFilterOption.sectionTitle
        case 1:
            title = IssueFilterDetailOption.sectionTitle
        default:
            return ""
        }
        
        return title
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return IssueFilterOption.allCases.count
        case 1:
            return IssueFilterDetailOption.allCases.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        
        switch section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PlainCell")
                as? PlainFilterTableViewCell else { return UITableViewCell() }
            cell.titleLabel.text = IssueFilterOption.allCases[indexPath.row].description
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell") else {
                return UITableViewCell()
            }
            cell.textLabel?.text = IssueFilterDetailOption.allCases[indexPath.row].description
            return cell
        default:
            return UITableViewCell()
        }
    }
    
}

extension IssueFilterViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("dd")
    }
}
