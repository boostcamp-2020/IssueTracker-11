//
//  MilestoneMainViewController.swift
//  IssueTracker
//
//  Created by 김근수 on 2020/11/02.
//  Copyright © 2020 김근수. All rights reserved.
//

import UIKit

final class MilestoneMainViewController: UIViewController {
    
    enum Section: CaseIterable {
        case main
    }
    
    // MARK: - Typealias
    
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Milestone>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Milestone>
    
    // MARK: - IBOutlet

    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    private let sections = Section.allCases
    private lazy var dataSource = makeDataSource()
    private var milestoneList: [Milestone] = [] {
        didSet { applySnapshot() }
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        registerNotifications()
        loadMilestones()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - IBAction
    
    @IBAction func addButtonDidTap(_ sender: UIBarButtonItem) {
        let mileStoneAddViewController: MilestoneAddViewController = {
            let nextVC = MilestoneAddViewController()
            nextVC.modalTransitionStyle = .crossDissolve
            nextVC.modalPresentationStyle = .overCurrentContext
            return nextVC
        }()
        self.present(mileStoneAddViewController, animated: true)
    }
    
    // MARK: - Methods
    
    private func registerNotifications() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self,
                                       selector: #selector(milestoneDidCreate),
                                       name: .milestoneDidCreate,
                                       object: nil)
        notificationCenter.addObserver(self,
                                       selector: #selector(milestoneDidUpdate),
                                       name: .milestoneDidUpdate,
                                       object: nil)
        notificationCenter.addObserver(self,
                                       selector: #selector(milestoneDidDelete),
                                       name: .milestoneDidDelete,
                                       object: nil)
    }
    
    private func loadMilestones() {
        MilestoneService.shared.getAll { [weak self] milestones in
            self?.milestoneList = milestones
        }
    }
    
    // MARK: - Objc
    
    @objc private func milestoneDidCreate(_ notification: Notification) {
        guard let milestone = notification.object as? Milestone else { return }
        milestoneList.append(milestone)
    }
    
    @objc private func milestoneDidUpdate(_ notification: Notification) {
        guard
            let milestone = notification.object as? Milestone,
            let id = milestone.id,
            let idx = milestoneList.firstIndex(where: { $0.id == id })
        else { return }
        milestoneList[idx] = milestone
    }
    
    @objc private func milestoneDidDelete(_ notification: Notification) {
        guard let id = notification.userInfo?["id"] as? Int else { return }
        milestoneList.removeAll { $0.id == id }
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
        snapshot.appendItems(milestoneList)
        dataSource.apply(snapshot, animatingDifferences: animatingDifferences)
    }
    
}

extension MilestoneMainViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedMilestone = milestoneList[indexPath.row]
        let idendtifier = String(describing: MilestoneDetailViewController.self)
        
        guard let viewController = storyboard?.instantiateViewController(identifier: idendtifier)
            as? MilestoneDetailViewController  else { return }
        viewController.milestone = selectedMilestone
        navigationController?.pushViewController(viewController, animated: true)
    }
    
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
