//
//  IssueInfoViewController.swift
//  IssueTracker
//
//  Created by 김근수 on 2020/11/05.
//  Copyright © 2020 김근수. All rights reserved.
//

import UIKit

final class IssueInfoViewController: PullUpController {
    
    // MARK: - Enum
    
    enum Section: CaseIterable {
        case assignee
        case label
        case milestone
        case close
        
        var title: String {
            switch self {
            case .assignee:
                return "담당자"
            case .label:
                return "레이블"
            case .milestone:
                return "마일스톤"
            case .close:
                return ""
            }
        }
    }
    
    enum DataItem: Hashable {
        case assignee(User)
        case label(Label)
        case milestone(Milestone?)
        case close
    }
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var buttonContainerView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var buttonContainerViewHeight: NSLayoutConstraint!
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    
    // MARK: - Properties
    
    private var assigneeList: [User] = []
    private var labelList: [Label] = []
    private var milestone: Milestone?
    private var portraitSize: CGSize = .zero
    private var landscapeFrame: CGRect = .zero
    private var safeAreaAdditionalOffset: CGFloat { 20 }
    private var dataSource: UICollectionViewDiffableDataSource<Section, DataItem>! = nil
    var initialPointOffset: CGFloat { (buttonContainerView?.frame.height ?? 0) + safeAreaAdditionalOffset }
    var issue: Issue?
    
    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureDatas(issue)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureContainerLayout()
        configureCollectionView()
        configureDataSource()
    }
    
    // MARK: - Methods
    
    private func configureDatas(_ issue: Issue?) {
        guard let assignees = issue?.assignees,
            let labels = issue?.labels,
            let milestone = issue?.milestone
            else { return }
        
        self.assigneeList = assignees
        self.labelList = labels
        self.milestone = milestone
        applySnapshot()
    }
    
    private func configureContainerLayout() {
        portraitSize = CGSize(width: view.frame.width,
                              height: view.frame.height * 0.85)
        buttonContainerViewHeight.constant = view.frame.height * 0.1
        collectionViewHeight.constant = view.frame.height * 0.75
        collectionView.attach(to: self)
    }
    
    private func configureCollectionView() {
        collectionView.collectionViewLayout = generateLayout()
    }
    
    private func showOKAlert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "네", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    override var pullUpControllerPreferredSize: CGSize { portraitSize }
    override var pullUpControllerPreferredLandscapeFrame: CGRect { landscapeFrame }
    override var pullUpControllerBounceOffset: CGFloat { 20 }
    
    override func pullUpControllerAnimate(action: PullUpController.Action,
                                          withDuration duration: TimeInterval,
                                          animations: @escaping () -> Void,
                                          completion: ((Bool) -> Void)?) {
        switch action {
        case .move:
            UIView.animate(withDuration: 0.3,
                           delay: 0,
                           usingSpringWithDamping: 0.7,
                           initialSpringVelocity: 0,
                           options: .curveEaseInOut,
                           animations: animations,
                           completion: completion)
        default:
            UIView.animate(withDuration: 0.3,
                           animations: animations,
                           completion: completion)
        }
    }
    
    // MARK: - Objc
    
    @objc private func closeButtonDidTap() {
        showOKAlert(title: "닫기버튼", message: "입니다")
    }
    
    @objc private func editButtonDidTap() {
        showOKAlert(title: "준비중", message: "서비스 준비중입니다")
    }
    
}

// MARK: - UICollectionViewDiffableDataSource

extension IssueInfoViewController {
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource
            <Section, DataItem>(collectionView: collectionView) { [weak self] (collectionView: UICollectionView, indexPath: IndexPath, item: DataItem)
                -> UICollectionViewCell? in
                
                let sectionKind = Section.allCases[indexPath.section]
                switch sectionKind {
                case .assignee:
                    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCell.reuseIdentifier,
                                                                        for: indexPath) as? ProfileCell,
                        let user = self?.assigneeList[indexPath.row]
                        else { return UICollectionViewCell() }
                    cell.configure(user: user)
                    return cell
                case .label:
                    guard let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: LabelCell.reuseIdentifier,
                        for: indexPath) as? LabelCell else { return UICollectionViewCell() }
                    _ = item
                    let label = self?.labelList[indexPath.row]
                    cell.configure(content: label)
                    return cell
                case .milestone:
                    guard let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: MilestoneCell.reuseIdentifier,
                        for: indexPath) as? MilestoneCell
                        else { return UICollectionViewCell() }
                    cell.configure(milestone: self?.milestone)
                    return cell
                case .close:
                    guard let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: CloseButtonCell.reuseIdentifier,
                        for: indexPath) as? CloseButtonCell else { return UICollectionViewCell() }
                    cell.configure(selector: #selector(self?.closeButtonDidTap),
                                   target: self)
                    return cell
                }
        }
        
        dataSource.supplementaryViewProvider = { [weak self] (collectionView: UICollectionView, kind: String, indexPath: IndexPath)
            -> UICollectionReusableView? in
            let sectionKind = Section.allCases[indexPath.section]
            if kind == UICollectionView.elementKindSectionHeader {
                guard let headerView = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: InfoHeaderView.reuseIdentifier,
                    for: indexPath) as? InfoHeaderView else { return UICollectionReusableView() }
                headerView.configure(title: sectionKind.title,
                                     selector: #selector(self?.editButtonDidTap),
                                     target: self)
                return headerView
            }
            
            if kind == UICollectionView.elementKindSectionFooter {
                let footerView = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: "sectionFooter",
                    for: indexPath)
                
                return footerView
            }
            
            return UICollectionReusableView()
        }
        
        applySnapshot()
    }
    
    func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, DataItem>()
        snapshot.appendSections(Section.allCases)
        
        let assigneeItem = assigneeList.map { DataItem.assignee($0) }
        snapshot.appendItems(assigneeItem, toSection: .assignee)
        
        let labelItem = labelList.map { DataItem.label($0) }
        snapshot.appendItems(labelItem, toSection: .label)
        
        snapshot.appendItems([DataItem.milestone(milestone)], toSection: .milestone)
        snapshot.appendItems([DataItem.close], toSection: .close)
        
        dataSource.apply(snapshot,
                         animatingDifferences: false)
    }
    
}

// MARK: - UICollectionViewLayout

extension IssueInfoViewController {
    
    func generateLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { [weak self] (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment)
            -> NSCollectionLayoutSection? in
            
            let sectionLayoutKind = Section.allCases[sectionIndex]
            switch sectionLayoutKind {
            case .assignee: return self?.generateAssigneeLayout()
            case .label: return self?.generateLabelLayout()
            case .milestone: return self?.generateMilestoneLayout()
            case .close: return self?.generateCloseLayout()
            }
        }
        
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 50
        layout.configuration = config
        
        return layout
    }
    
    func generateAssigneeLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/6),
                                               heightDimension: .fractionalWidth(1/5))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [generateSectionFooter(), generateSectionHeader()]
        section.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 20, bottom: 15, trailing: 20)
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 15
        return section
    }
    
    func generateLabelLayout() -> NSCollectionLayoutSection {
        let size = NSCollectionLayoutSize(widthDimension: .estimated(10),
                                          heightDimension: .absolute(30))
        let item = NSCollectionLayoutItem(layoutSize: size)
        let group = NSCollectionLayoutGroup.vertical(layoutSize: size, subitem: item, count: 1)
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [generateSectionFooter(), generateSectionHeader()]
        section.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 20, bottom: 15, trailing: 20)
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 15
        
        return section
    }
    
    func generateMilestoneLayout() -> NSCollectionLayoutSection {
        let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                          heightDimension: .absolute(80))
        let item = NSCollectionLayoutItem(layoutSize: size)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: size, subitem: item, count: 1)
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [generateSectionFooter(), generateSectionHeader()]
        section.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 20, bottom: 15, trailing: 20)
        section.interGroupSpacing = 15
        
        return section
    }
    
    func generateCloseLayout() -> NSCollectionLayoutSection {
        let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                          heightDimension: .absolute(40))
        let item = NSCollectionLayoutItem(layoutSize: size)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: size, subitem: item, count: 1)
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [generateSectionFooter()]
        section.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 20, bottom: 15, trailing: 20)
        section.interGroupSpacing = 15
        
        return section
    }
    
    func generateSectionFooter() -> NSCollectionLayoutBoundarySupplementaryItem {
        let footerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(1))
        let sectionFooter = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: footerSize,
            elementKind: UICollectionView.elementKindSectionFooter,
            alignment: .bottomLeading)
        
        return sectionFooter
    }
    
    func generateSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(40))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        
        return sectionHeader
    }
    
}
