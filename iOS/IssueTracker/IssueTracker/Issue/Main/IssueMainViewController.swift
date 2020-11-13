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
    
    private var searchController: UISearchController = {
        let controller = UISearchController()
        controller.obscuresBackgroundDuringPresentation = false
        return controller
    }()
    
    private let refreshControl = UIRefreshControl()
    
    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
        loadIssueList()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl.addTarget(self, action: #selector(didPullToRefresh(_:)), for: .valueChanged)
        issueCollectionView.refreshControl = refreshControl
        issueCollectionView.alwaysBounceVertical = true
        registerNotifications()
        configure()
    }
    
    // MARK: - IBAction
    
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
        }
    }
    
    private func closeIssue(ids: [Int], status: Int) {
        if status == 0 {
            showOKAlert(title: "Closed", message: "이슈가 이미 닫혀있습니다!")
            return
        }
        
        IssueService.shared.closeIssue(ids: ids) { [weak self] in
            self?.showOKAlert(title: "Closed", message: "이슈가 닫혔습니다!")
        }
    }
    
    private func showOKAlert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "네", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func deleteIssue(id: Int) {
        IssueService.shared.delete(id: id) { [weak self] in
            self?.issueList.removeAll { $0.id == id }
        }
    }
    
    private func configure() {
        initButtons()
        configureNavigationItems()
        
        let tabbarHeight = tabBarController?.tabBar.frame.height ?? 0
        let rect = CGRect(x: 0,
                          y: view.frame.height,
                          width: view.frame.width,
                          height: tabbarHeight)
        bottomMenuView = BottomMenuView(frame: rect)
        self.view.addSubview(bottomMenuView ?? UIView())
        bottomMenuView?.delegate = self
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
        
        filterButton = UIBarButtonItem(title: "Filter",
                                       style: .plain,
                                       target: self,
                                       action: #selector(segueToFilterViewController))
    }
    
    private func configureNavigationItems() {
        searchController.searchResultsUpdater = self
        searchController.delegate = self
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        navigationItem.leftBarButtonItem = filterButton
        navigationItem.rightBarButtonItem = editButton
    }
    
    private func registerNotifications() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self,
                                       selector: #selector(issueDidCreate),
                                       name: .issueDidCreate,
                                       object: nil)
    }
    
    private func filterDataSource(with str: String) {
        let filtered = issueList.filter {
            guard let title = $0.title else { return false }
            return title.contains(str)
        }
        
        applyDynamicSnapshot(with: filtered)
    }
    
    // MARK: - Objc
    
    @objc private func issueDidCreate(_ notification: Notification) {
        loadIssueList()
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
        issueCollectionView.excuteAll(handler: { cell in
            guard let cell = cell as? IssueCollectionViewCell else { return }
            cell.isEditing = self.isEditing
        })
        
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
        guard let filterNavigationViewController =
                storyboard?.instantiateViewController(withIdentifier: "IssueFilterNavigationController"),
              let filterViewController = filterNavigationViewController.children.first as? IssueFilterViewController
         else { return }
        filterViewController.delegate = self
        self.present(filterNavigationViewController, animated: true)
    }
    
    @objc func didPullToRefresh(_ sender: Any) {
        loadIssueList()
        refreshControl.endRefreshing()
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
    
    private func applyDynamicSnapshot(with issues: [Issue], animatingDifferences: Bool = true) {
        var snapshot = Snapshot()
        snapshot.appendSections(sections)
        snapshot.appendItems(issues)
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
        } else {
            let identifier = String(describing: IssueDetailViewController.self)
            guard let viewController = storyboard?.instantiateViewController(withIdentifier: identifier)
                    as? IssueDetailViewController else { return }
            
            viewController.issueID = issueList[indexPath.item].id
            navigationController?.pushViewController(viewController,
                                                     animated: true)
        }
        
    }
    
    func leftHiddenContainerViewTapped(inCell cell: UICollectionViewCell) {
        guard
            let cell = cell as? IssueCollectionViewCell,
            let indexPath = issueCollectionView.indexPath(for: cell),
            let id = issueList[indexPath.item].id,
            let status = issueList[indexPath.item].status
        else { return }
        
        closeIssue(ids: [id], status: status)
    }
    
    func rightHiddenContainerViewTapped(inCell cell: UICollectionViewCell) {
        guard
            let cell = cell as? IssueCollectionViewCell,
            let indexPath = issueCollectionView.indexPath(for: cell),
            let id = issueList[indexPath.item].id,
                let status = issueList[indexPath.item].status
            else { return }
        
        deleteIssue(id: id)
    }
    
}

extension IssueMainViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        filterDataSource(with: searchController.searchBar.text ?? "")
    }
    
}

extension IssueMainViewController: UISearchControllerDelegate {
    
    func didDismissSearchController(_ searchController: UISearchController) {
        applySnapshot()
    }
    
}

extension IssueMainViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        filterDataSource(with: searchBar.text ?? "")
    }
    
}

extension IssueMainViewController: IssueFilterControllerDelegate {
    
    func filterOptionDidChange(options: [PlainFilterOption]) {
        var filtered = issueList
        options.forEach { filtered = $0.filter(with: filtered) }
        applyDynamicSnapshot(with: filtered)
    }
    
    func filterControllerWillAppear() {
        applySnapshot()
    }
    
}

extension IssueMainViewController: IssuesCloseDelegate {
    
    func issuesClose() {
        guard let indexPaths = issueCollectionView.indexPathsForSelectedItems else { return }
        var issueIDs: [Int] = []
        indexPaths.forEach {
            guard let id = issueList[$0.row].id else { return }
            issueIDs.append(id)
        }
        closeIssue(ids: issueIDs, status: 1)
        toggleEditMode()
    }
    
}
