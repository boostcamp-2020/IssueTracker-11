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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadLabelList()
        applyLabelSnapshot()
    }
    
    // MARK: - Methods
    
    /// 라벨 리스트 통신
    private func loadLabelList() {
        labelList.append(Label(id: 1, type: "타입1", title: "히히히히히히히히히히히히히히히히히히히히히히히히히히히히히히히히히히히히히히히히히히히히히히히히히히히히히히히히히히히히"))
        labelList.append(Label(id: 2, type: "타입2", title: "안녕하세욜"))
        labelList.append(Label(id: 3, type: "타입3", title: "안녕하세욜"))
    }
    
    // MARK: - IBActions
    
    @IBAction func labelAddButtonDidTap(_ sender: UIButton) {

    }
    
}

// MARK: - DiffableDataSource
extension LabelMainViewController {
    
    func makeDataSource() -> DataSource {
        let dataSource = DataSource(
            collectionView: labelCollectionView,
            cellProvider: { (collectionView, indexPath, label) ->
                UICollectionViewCell? in
                
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: "LabelCollectionViewCell",
                    for: indexPath) as? LabelCollectionViewCell
                
                cell?.labelCollectionViewCellConfigure(content: label)
                return cell
        })
        
        return dataSource
    }
    
    func applyLabelSnapshot(animatingDifferences: Bool = true) {
        var snapshot = Snapshot()
        snapshot.appendSections(sections)
        snapshot.appendItems(labelList)
        dataSource.apply(snapshot,
                         animatingDifferences: animatingDifferences)
    }
    
}

// MARK: - CollectionViewDelegateFlowLayout
extension LabelMainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.view.bounds.width,
                      height: 60)
    }
    
}
