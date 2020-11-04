//
//  IssueMainViewController.swift
//  IssueTracker
//
//  Created by 양어진 on 2020/11/03.
//  Copyright © 2020 양어진. All rights reserved.
//

import UIKit

final class IssueMainViewController: UIViewController {

    @IBOutlet weak var issueCollectionView: UICollectionView!
    
    private var editButton: UIBarButtonItem?
    private var cancelButton: UIBarButtonItem?
    private var selectAllButton: UIBarButtonItem?
    private var filterButton: UIBarButtonItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        issueCollectionView.delegate = self
        issueCollectionView.dataSource = self
        
        configure()
    }
    
    private func configure() {
        initButtons()
        navigationItem.searchController = UISearchController()
        navigationItem.leftBarButtonItem = filterButton
        navigationItem.rightBarButtonItem = editButton
    }
    
    private func initButtons() {
        editButton = UIBarButtonItem(barButtonSystemItem: .edit,
                                     target: self,
                                     action: #selector(toggleEditMode))
        
        cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel,
                                                   target: self,
                                                   action: #selector(toggleEditMode))
        
        selectAllButton = UIBarButtonItem(title: "Select All",
                                          style: .plain,
                                          target: self,
                                          action: nil)
        
        filterButton = UIBarButtonItem(title: "filter",
                                       style: .plain,
                                       target: self,
                                       action: nil)
    }
    
    @objc func toggleEditMode(_ sender: UIBarButtonItem) {
        setEditing(!isEditing, animated: true)
        navigationItem.setLeftBarButton(isEditing ? selectAllButton : filterButton, animated: true)
        navigationItem.rightBarButtonItem = isEditing ? cancelButton : editButton
        navigationItem.searchController?.searchBar.isUserInteractionEnabled = !isEditing
    }
    
}

extension IssueMainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IssueCollectionViewCell",
                                                            for: indexPath) as? IssueCollectionViewCell
            else { return UICollectionViewCell() }
        return cell
    }
}

extension IssueMainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 88)
    }
    
}

extension IssueMainViewController: UICollectionViewDelegate {
    
}
