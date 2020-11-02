//
//  MilestoneMainViewController.swift
//  IssueTracker
//
//  Created by 김근수 on 2020/11/02.
//  Copyright © 2020 김근수. All rights reserved.
//

import UIKit

class MilestoneMainViewController: UIViewController {
    
    enum Section: CaseIterable {
        case main
    }
    
    // MARK: - Typealias
    
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Milestone>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Milestone>
    
    // MARK: - IBOutlet

    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    let sections = Section.allCases
    private lazy var dataSource = makeDataSource()
    
    let dummy = [Milestone(id: 1,
                           title: "스프린트1",
                           dueDate: "2020년 6월 19일 까지",
                           description: "이번 배포를 위한 스프린트",
                           openNumber: 13,
                           closedNumber: 23),
                 Milestone(id: 2,
                           title: "스프린트2",
                           dueDate: "2020년 6월 25일 까지",
                           description: "다음 배포를 위한 스프린트",
                           openNumber: 0,
                           closedNumber: 0)]
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        applySnapshot()
    }
    
    // MARK: - Methods
    
    // MARK: - IBAction
    
    @IBAction func addButtonDidTap(_ sender: UIBarButtonItem) {
        let mileStoneAddVC: MilestoneAddViewController = {
            let nextVC = MilestoneAddViewController()
            nextVC.modalTransitionStyle = .crossDissolve
            nextVC.modalPresentationStyle = .overCurrentContext
            return nextVC
        }()
        self.present(mileStoneAddVC, animated: true)
    }
}

extension MilestoneMainViewController {
    
    func makeDataSource() -> DataSource {
        let dataSource = DataSource(collectionView: collectionView,
                                    cellProvider: {(collectionView, indexPath, milestone) -> UICollectionViewCell? in
                                        let cell = collectionView.dequeueReusableCell(
                                            withReuseIdentifier: MilestoneCollectionViewCell.identifier,
                                          for: indexPath) as? MilestoneCollectionViewCell
                                        cell?.configure(with: milestone)
                                        return cell
        })
        return dataSource
    }
    
    func applySnapshot(animatingDifferences: Bool = true) {
        var snapshot = Snapshot()
        snapshot.appendSections(sections)
        snapshot.appendItems(dummy)
        dataSource.apply(snapshot, animatingDifferences: animatingDifferences)
    }
    
}

extension MilestoneMainViewController: UICollectionViewDelegate {
    
}

extension MilestoneMainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
}
