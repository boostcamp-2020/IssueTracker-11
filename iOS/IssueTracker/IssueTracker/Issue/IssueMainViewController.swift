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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        issueCollectionView.delegate = self
        issueCollectionView.dataSource = self
        
        configure()
    }

    private func configure() {
        self.navigationItem.searchController = UISearchController()
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
//        cell.issueContentView.configure(text: "hihi")
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
