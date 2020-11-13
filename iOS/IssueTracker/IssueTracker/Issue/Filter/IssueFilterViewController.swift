//
//  IssueFilterViewController.swift
//  IssueTracker
//
//  Created by 김근수 on 2020/11/04.
//  Copyright © 2020 김근수. All rights reserved.
//

import UIKit

protocol IssueFilterControllerDelegate: class {
    func filterOptionDidChange(options: [PlainFilterOption])
    func filterControllerWillAppear()
}

final class IssueFilterViewController: UIViewController {

    // MARK: - IBOutlet
    
    @IBOutlet private weak var filterTableView: UITableView!
    
    // MARK: - Properties
    
    private let filterDataSource = FilterDataSource()
    private let plainOptions = PlainFilterOption.allCases
    private let detailOptions = DetailFilterOption.allCases
    private let alertController: UIAlertController = {
        let alert = UIAlertController(title: "옵션을 선택하세요",
                                      message: "세부 조건을 제외한 옵션을 선택하세요🤔",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        return alert
    }()
    weak var delegate: IssueFilterControllerDelegate?
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filterTableView.delegate = self
        filterTableView.allowsMultipleSelection = true
        configureDataSource()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        delegate?.filterControllerWillAppear()
    }
    
    // MARK: - IBActions
    
    @IBAction func cancelButtonDidTap(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonDidTap(_ sender: UIBarButtonItem) {
        guard let indexPaths = filterTableView.indexPathsForSelectedRows else {
            self.present(alertController, animated: true, completion: nil)
            return
        }
        guard let plainOptions = filterDataSource.plainFilterOptions else { return }
        var selectedOptions: [PlainFilterOption] = []
        
        indexPaths.forEach { selectedOptions.append(plainOptions[$0.row]) }
        delegate?.filterOptionDidChange(options: selectedOptions)
        self.dismiss(animated: true, completion: nil)
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
