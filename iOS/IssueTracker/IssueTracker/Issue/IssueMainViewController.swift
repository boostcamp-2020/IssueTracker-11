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
    
    private var bottomMenuView: BottomMenuView?
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
        
        let tabbarHeight = tabBarController?.tabBar.frame.height ?? 0
        let rect = CGRect(x: 0, y: view.frame.height, width: view.frame.width, height: tabbarHeight)
        bottomMenuView = BottomMenuView(frame: rect)
        self.view.addSubview(bottomMenuView ?? UIView())
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
                                          action: #selector(selectAllCell))
        
        filterButton = UIBarButtonItem(title: "filter",
                                       style: .plain,
                                       target: self,
                                       action: #selector(segueToFilterViewController))
    }
    
    @objc func toggleEditMode() {
        setEditing(!isEditing, animated: true)
        // 1. Toggle Navigation Items
        navigationItem.setLeftBarButton(isEditing ? selectAllButton : filterButton, animated: true)
        navigationItem.rightBarButtonItem = isEditing ? cancelButton : editButton
        navigationItem.searchController?.searchBar.isUserInteractionEnabled = !isEditing
        
        // 2. Toggle Cell Status
        if !isEditing { issueCollectionView.deselectAll() }
        issueCollectionView.allowsMultipleSelection = isEditing
        issueCollectionView.indexPathsForVisibleItems.forEach { indexPath in
            guard let cell = issueCollectionView.cellForItem(at: indexPath)
                as? IssueCollectionViewCell else { return }
            cell.isEditing = isEditing
        }
        
        // 3. Toggle Bottom Menu View
        UIView.animate(withDuration: 0.2) {
            self.tabBarController?.tabBar.alpha = self.isEditing ? 0 : 1
            self.bottomMenuView?.toggle(with: self.isEditing)
        }
    }
    
    @objc func selectAllCell() {
        issueCollectionView.selectAll()
    }
    
    @objc func segueToFilterViewController() {
        guard let filterViewController =
            storyboard?.instantiateViewController(withIdentifier: "IssueFilterNavigationController") else { return }
        self.present(filterViewController, animated: true)
    }
    
}

extension IssueMainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IssueCollectionViewCell.identifier,
                                                            for: indexPath) as? IssueCollectionViewCell
            else { return UICollectionViewCell() }
        cell.configure(isEditing: isEditing)
        cell.delegate = self
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Self!!")
    }
    
}

extension IssueMainViewController: SwipeableCollectionViewCellDelegate {
    
    func visibleContainerViewTapped(inCell cell: UICollectionViewCell) {
        guard
            let cell = cell as? IssueCollectionViewCell,
            let indexPath = issueCollectionView.indexPath(for: cell)
        else { return }
        
        if isEditing {
            cell.isSelected ? issueCollectionView.deselectItem(at: indexPath, animated: true) :
                issueCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
        }
    }
    
    func leftHiddenContainerViewTapped(inCell cell: UICollectionViewCell) {
    }
    
    func rightHiddenContainerViewTapped(inCell cell: UICollectionViewCell) {
    }
    
}
