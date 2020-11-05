//
//  IssueFilterViewController.swift
//  IssueTracker
//
//  Created by 김근수 on 2020/11/04.
//  Copyright © 2020 김근수. All rights reserved.
//

import UIKit

final class IssueFilterViewController: UIViewController {

    // MARK: - IBOutlet
    
    @IBOutlet private weak var filterTableView: UITableView!
    
    // MARK: - Properties
    
    private let filterDataSource = FilterDataSource()
    private let plainOptions = PlainFilterOption.allCases
    private let detailOptions = DetailFilterOption.allCases
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filterTableView.delegate = self
        filterTableView.allowsMultipleSelection = true
        configureDataSource()
    }
    
    // MARK: - IBActions
    
    @IBAction func cancelButtonDidTap(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonDidTap(_ sender: UIBarButtonItem) {
    }
    
    // MARK: - Methods
    
    private func configureDataSource() {
        filterDataSource.plainFilterOptions = plainOptions
        filterDataSource.detailFilterOptions = detailOptions
        filterTableView.dataSource = filterDataSource
    }
    
    private func navigateToFilterDetailViewController(_ title: String?) {
        let identifier = String(describing: FilterDetailViewController.self)
        guard
            let filterDetailViewController = storyboard?.instantiateViewController(identifier: identifier)
            as? FilterDetailViewController
        else { return }
        filterDetailViewController.navigationBarTitle = title
        self.navigationController?.pushViewController(filterDetailViewController, animated: true)
    }
    
}

extension IssueFilterViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let section = FilterDataSource.Section(indexPath.section) else { return }
        
        switch section {
        case .plain:
            print("추가해야함")
        case .detail:
            navigateToFilterDetailViewController(detailOptions[indexPath.row].description)
        }
    }
    
}
