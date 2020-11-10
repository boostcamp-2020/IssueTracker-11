//
//  LabelMainViewController.swift
//  IssueTracker
//
//  Created by 양어진 on 2020/11/02.
//  Copyright © 2020 양어진. All rights reserved.
//

import UIKit

final class LabelMainViewController: UIViewController {
    
    enum Section: CaseIterable {
        case main
    }
    
    // MARK: - Typealias
    
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Label>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Label>
    
    // MARK: - IBOutlet
    
    @IBOutlet private weak var labelCollectionView: UICollectionView!
    
    // MARK: - Properties
    
    private lazy var dataSource = makeDataSource()
    private let sections = Section.allCases
    private var labelList: [Label] = []
    
    // MARK: - LifeCycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadLabelList()
        applySnapshot()
    }
    
    // MARK: - Methods
    
    /// 라벨 리스트 통신
    private func loadLabelList() {
        LabelService.shared.getLables { [weak self] result in
            self?.labelList = result
            DispatchQueue.main.async {
                self?.applySnapshot()
            }
        }
    }
    
    // MARK: - IBActions
    
    @IBAction private func labelAddButtonDidTap(_ sender: UIButton) {
        let labelAddViewController: LabelAddViewController = {
            let nextViewController = LabelAddViewController()
            nextViewController.modalTransitionStyle = .crossDissolve
            nextViewController.modalPresentationStyle = .overCurrentContext
            return nextViewController
        }()
        self.present(labelAddViewController, animated: true)
    }
    
}

// MARK: - DiffableDataSource
extension LabelMainViewController {
    
    func makeDataSource() -> DataSource {
        let dataSource = DataSource(
            collectionView: labelCollectionView,
            cellProvider: { (collectionView, indexPath, label) ->
                UICollectionViewCell? in
                let cell = collectionView
                    .dequeueReusableCell(withReuseIdentifier: "LabelCollectionViewCell",
                                         for: indexPath) as? LabelCollectionViewCell
                cell?.configure(content: label)
                return cell
        })
        return dataSource
    }
    
    func applySnapshot(animatingDifferences: Bool = true) {
        var snapshot = Snapshot()
        snapshot.appendSections(sections)
        snapshot.appendItems(labelList)
        dataSource.apply(snapshot,
                         animatingDifferences: animatingDifferences)
    }
    
}

// MARK: - CollectionViewDelegate
extension LabelMainViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        
        let identifier = String(describing: LabelDetailViewController.self)
        guard let viewController = storyboard?.instantiateViewController(withIdentifier: identifier)
            as? LabelDetailViewController else { return }
    
        viewController.label = labelList[indexPath.item]
        navigationController?.pushViewController(viewController,
                                                 animated: true)
    }
    
}

// MARK: - CollectionViewDelegateFlowLayout
extension LabelMainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.view.bounds.width,
                      height: 76)
    }
    
}
