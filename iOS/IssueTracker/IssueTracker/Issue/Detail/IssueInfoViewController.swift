//
//  IssueInfoViewController.swift
//  IssueTracker
//
//  Created by 김근수 on 2020/11/05.
//  Copyright © 2020 김근수. All rights reserved.
//

import UIKit

final class IssueInfoViewController: PullUpController {
    
    enum Section: CaseIterable {
        case asignee
        case label
        case milestone
        case close
        
        var title: String {
            switch self {
            case .asignee:
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
    
    @IBOutlet weak var buttonContainerView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var buttonContainerViewHeight: NSLayoutConstraint!
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!

    var dataSource: UICollectionViewDiffableDataSource<Section, Int>! = nil
    
    var initialPointOffset: CGFloat {
       return (buttonContainerView?.frame.height ?? 0) + safeAreaAdditionalOffset
    }
    
    public var portraitSize: CGSize = .zero
    public var landscapeFrame: CGRect = .zero
    
    private var safeAreaAdditionalOffset: CGFloat {
        return 20
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContainerLayout()
        configureCollectionView()
        configureDataSource()
    }
    
    func configureContainerLayout() {
        portraitSize = CGSize(width: view.frame.width,
                              height: view.frame.height * 0.85)
        buttonContainerViewHeight.constant = view.frame.height * 0.1
        collectionViewHeight.constant = view.frame.height * 0.75
        collectionView.attach(to: self)
    }
    
    @objc func testFunc() {}
    
    override var pullUpControllerPreferredSize: CGSize {
        return portraitSize
    }
    
    override var pullUpControllerPreferredLandscapeFrame: CGRect {
        return landscapeFrame
    }
    
    override var pullUpControllerBounceOffset: CGFloat {
        return 20
    }
    
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
 
}

extension IssueInfoViewController {
    
    func configureCollectionView() {
        collectionView.collectionViewLayout = generateLayout()
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource
            <Section, Int>(collectionView: collectionView) {
                (collectionView: UICollectionView, indexPath: IndexPath, item: Int) -> UICollectionViewCell? in
                let sectionKind = Section.allCases[indexPath.section]
                switch sectionKind {
                case .asignee:
                    guard let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: ProfileCell.reuseIdentifier,
                        for: indexPath) as? ProfileCell else { fatalError("Could not create new cell") }
                    _ = item
                    return cell
                case .label:
                    guard let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: LabelCell.reuseIdentifier,
                        for: indexPath) as? LabelCell else { fatalError("Could not create new cell") }
                    _ = item
                    return cell
                case .milestone:
                    guard let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: MilestoneCell.reuseIdentifier,
                        for: indexPath) as? MilestoneCell else { fatalError("Could not create new cell") }
                    _ = item
                    return cell
                case .close:
                    guard let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: CloseButtonCell.reuseIdentifier,
                        for: indexPath) as? CloseButtonCell else { fatalError("Could not create new cell") }
                    _ = item
                    return cell
                }
        }
        
        dataSource.supplementaryViewProvider = {
            (collectionView: UICollectionView, kind: String, indexPath: IndexPath) -> UICollectionReusableView? in
            let sectionKind = Section.allCases[indexPath.section]
            if kind == UICollectionView.elementKindSectionHeader {
                guard let headerView = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: InfoHeaderView.reuseIdentifier,
                    for: indexPath) as? InfoHeaderView else { return UICollectionReusableView() }
                headerView.configure(title: sectionKind.title, selector: #selector(self.testFunc))
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
        
        let snapshot = snapshotForCurrentState()
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    func snapshotForCurrentState() -> NSDiffableDataSourceSnapshot<Section, Int> {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Int>()
        let fItems = Array(1...5)
        let sItems = Array(7...10)
        let tItems = [11]
        let foItems = [12]
        snapshot.appendSections([Section.asignee])
        snapshot.appendItems(fItems)
        
        snapshot.appendSections([Section.label])
        snapshot.appendItems(sItems)
        
        snapshot.appendSections([Section.milestone])
        snapshot.appendItems(tItems)
        
        snapshot.appendSections([Section.close])
        snapshot.appendItems(foItems)
        
        return snapshot
    }
    
    func generateLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout {
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            let sectionLayoutKind = Section.allCases[sectionIndex]
            switch sectionLayoutKind {
            case .asignee: return self.generateAssigneeLayout()
            case .label: return self.generateLabelLayout()
            case .milestone: return self.generateMilestoneLayout()
            case .close: return self.generateCloseLayout()
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

