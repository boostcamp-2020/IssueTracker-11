//
//  IssueDetailViewController.swift
//  IssueTracker
//
//  Created by 양어진 on 2020/11/04.
//  Copyright © 2020 김근수. All rights reserved.
//

import UIKit

final class IssueDetailViewController: UIViewController {
    
    @IBOutlet private weak var commentCollectionView: UICollectionView!
    
    private var commentList: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarController?.tabBar.isHidden = true
        loadComment()
        setFlowLayout()
        addPullUpController(animated: true)
    }
    
    private func loadComment() {
        commentList = [ "ㅋㅋㅋㅋㅋ", "댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글", "잘하네요"]
    }
    
    private func setFlowLayout() {
        guard let flowLayout = commentCollectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        flowLayout.estimatedItemSize = CGSize(width: commentCollectionView.frame.width, height: 174)
    }
    
}

extension IssueDetailViewController {
    
    private func makeIssueInfoViewControllerIfNeeded() -> IssueInfoViewController {
        let identifier = String(describing: IssueInfoViewController.self)
        guard let issueInfoViewController = storyboard?.instantiateViewController(identifier: identifier)
            as? IssueInfoViewController else { return IssueInfoViewController() }
        
        return issueInfoViewController
    }
    
    private func addPullUpController(animated: Bool) {
        let pullUpController = makeIssueInfoViewControllerIfNeeded()
        _ = pullUpController.view
        addPullUpController(pullUpController,
                            initialStickyPointOffset: pullUpController.initialPointOffset,
                            animated: animated)
    }
    
}

extension IssueDetailViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        guard let headerView = collectionView
            .dequeueReusableSupplementaryView(ofKind: kind,
                                              withReuseIdentifier: "CommentHeaderReusableView",
                                              for: indexPath) as? CommentHeaderReusableView
            else { return UICollectionReusableView() }
        
        headerView.conigure(status: false)
        
        return headerView
    }
}

extension IssueDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return commentList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: "CommentCollectionViewCell",
                                 for: indexPath) as? CommentCollectionViewCell,
            let comment = commentList?[indexPath.item]
            else { return UICollectionViewCell() }
        
        cell.conigure(text: comment)
        
        return cell
    }
    
}

// MARK: - CollectionViewDelegateFlowLayout

extension IssueDetailViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        let indexPath = IndexPath(row: 0, section: section)
        let headerView = self.collectionView(
            collectionView,
            viewForSupplementaryElementOfKind: UICollectionView.elementKindSectionHeader,
            at: indexPath)
        
        return headerView.systemLayoutSizeFitting(CGSize(width: collectionView.frame.width,
                                                         height: UIView.layoutFittingExpandedSize.height),
                                                  withHorizontalFittingPriority: .required,
                                                  verticalFittingPriority: .fittingSizeLevel)
    }
    
}
