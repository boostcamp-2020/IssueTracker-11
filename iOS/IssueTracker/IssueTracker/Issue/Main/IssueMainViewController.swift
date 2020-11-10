//
//  IssueMainViewController.swift
//  IssueTracker
//
//  Created by 양어진 on 2020/11/03.
//  Copyright © 2020 양어진. All rights reserved.
//
import UIKit

final class IssueMainViewController: UIViewController {
    
    enum Section: CaseIterable {
        case main
    }
    
    // MARK: - Typealias
    
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Issue>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Issue>
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var issueCollectionView: UICollectionView!
    
    // MARK: - Properties
    
    private lazy var dataSource = makeDataSource()
    private let sections = Section.allCases
    private var bottomMenuView: BottomMenuView?
    private var issueList: [Issue] = [] {
        didSet { applySnapshot() }
    }
    
    private var editButton: UIBarButtonItem?
    private var cancelButton: UIBarButtonItem?
    private var selectAllButton: UIBarButtonItem?
    private var filterButton: UIBarButtonItem?
    
    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadIssueList()
        applySnapshot()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNotifications()
        configure()
    }
    
    @IBAction func addButtonDidTap(_ sender: UIButton) {
        guard let addIssueViewController =
            storyboard?.instantiateViewController(withIdentifier: "addIssueNavigationController") else { return }
        self.present(addIssueViewController, animated: true)
    }
    
    // MARK: - Methods
    
    /// 이슈 리스트 통신
    private func loadIssueList() {
        IssueService.shared.getAll { [weak self] result in
            self?.issueList = result
            DispatchQueue.main.async {
                self?.applySnapshot()
            }
        }
    }
    
    private func closeIssue(id: Int) {
        
    }
    
    private func deleteIssue(id: Int) {
        
    }
    
    private func configure() {
        initButtons()
        navigationItem.searchController = UISearchController()
        navigationItem.leftBarButtonItem = filterButton
        navigationItem.rightBarButtonItem = editButton
        
        let tabbarHeight = tabBarController?.tabBar.frame.height ?? 0
        let rect = CGRect(x: 0,
                          y: view.frame.height,
                          width: view.frame.width,
                          height: tabbarHeight)
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
    
    private func registerNotifications() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self,
                                       selector: #selector(issueDidCreate),
                                       name: Notification.Name(rawValue: "IssueDidCreate"),
                                       object: nil)
    }
    
    // MARK: - Objc
    
    @objc private func issueDidCreate(_ notification: Notification) {
        guard let issue = notification.object as? Issue else { return }
        issueList.append(issue)
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

// MARK: - DiffableDataSource

extension IssueMainViewController {
    
    private func makeDataSource() -> DataSource {
        let dataSource = DataSource(
            collectionView: issueCollectionView,
            cellProvider: {  [weak self] (collectionView, indexPath, issue)
                -> UICollectionViewCell? in
                let cell = collectionView
                    .dequeueReusableCell(withReuseIdentifier: IssueCollectionViewCell.identifier,
                                         for: indexPath) as? IssueCollectionViewCell
                guard let isEditing = self?.isEditing else {
                    return UICollectionViewCell()
                }
                
                cell?.configure(issue: issue,
                                isEditing: isEditing)
                cell?.delegate = self
                return cell
        })
        
        return dataSource
    }
    
    private func applySnapshot(animatingDifferences: Bool = true) {
        var snapshot = Snapshot()
        snapshot.appendSections(sections)
        snapshot.appendItems(issueList)
        dataSource.apply(snapshot,
                         animatingDifferences: animatingDifferences)
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension IssueMainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 104)
    }
    
}

// MARK: - UICollectionViewDelegate

extension IssueMainViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        print("Self!!")
    }
    
}

// MARK: - SwipeableCollectionViewCellDelegate

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
        guard
            let cell = cell as? IssueCollectionViewCell,
            let indexPath = issueCollectionView.indexPath(for: cell),
            let id = issueList[indexPath.item].id
        else { return }

        closeIssue(id: id)
    }
    
    func rightHiddenContainerViewTapped(inCell cell: UICollectionViewCell) {
        guard
            let cell = cell as? IssueCollectionViewCell,
            let indexPath = issueCollectionView.indexPath(for: cell),
            let id = issueList[indexPath.item].id
        else { return }

        deleteIssue(id: id)
    }
    
}
