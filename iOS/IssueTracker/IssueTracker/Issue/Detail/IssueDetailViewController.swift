//
//  IssueDetailViewController.swift
//  IssueTracker
//
//  Created by 양어진 on 2020/11/04.
//  Copyright © 2020 김근수. All rights reserved.
//

import UIKit

final class IssueDetailViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet private weak var commentCollectionView: UICollectionView!
    
    // MARK: - Properties
    
    var issueID: Int?
    private var issue: Issue?
    private var commentList: [Comment] = []
    
    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setFlowLayout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarController?.tabBar.isHidden = true
        loadIssueDetail()
    }

    // MARK: - Methods
    
    private func openAddView() {
        guard let addCommentViewController = storyboard?
                .instantiateViewController(withIdentifier: "addCommentViewController"),
            let firstViewController = addCommentViewController.children.first as? CommentAddViewController
            else { return }
        firstViewController.issueID = issueID
        self.present(addCommentViewController, animated: true)
    }
    
    private func loadIssueDetail() {
        guard let id = issueID else { return }
        IssueDetailService.shared.get(issueID: id) { [weak self] result in
            self?.issue = result
            guard let firstComment = self?.contentsToComment(result) else { return }
            self?.commentList.append(firstComment)
            self?.commentList.append(contentsOf: result.comments ?? [])
            self?.commentCollectionView.reloadData()
            self?.addPullUpController(animated: true)
        }
    }
    
    private func setFlowLayout() {
        guard let flowLayout = commentCollectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        flowLayout.estimatedItemSize = CGSize(width: self.view.frame.width, height: 174)
    }
    
    private func contentsToComment(_ issue: Issue) -> Comment {
        return Comment(id: issue.id,
                       contents: issue.contents,
                       issueID: issue.id,
                       authorID: issue.author?.id,
                       createdAt: issue.createdAt,
                       updatedAt: issue.updatedAt)
    }
    
}

extension IssueDetailViewController {
    
    private func makeIssueInfoViewControllerIfNeeded() -> IssueInfoViewController {
        let identifier = String(describing: IssueInfoViewController.self)
        guard let issueInfoViewController = storyboard?.instantiateViewController(identifier: identifier)
            as? IssueInfoViewController else { return IssueInfoViewController() }
        issueInfoViewController.issue = issue
        return issueInfoViewController
    }
    
    private func addPullUpController(animated: Bool) {
        let pullUpController = makeIssueInfoViewControllerIfNeeded()
        _ = pullUpController.view
        pullUpController.delegate = self
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
                                              for: indexPath) as? CommentHeaderReusableView,
            let issue = issue
            else { return UICollectionReusableView() }
        headerView.conigure(issue)
        return headerView
    }
}

extension IssueDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return commentList.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: "CommentCollectionViewCell",
                                 for: indexPath) as? CommentCollectionViewCell
            else { return UICollectionViewCell() }
        let comment = commentList[indexPath.item]
        cell.conigure(comment)
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

extension IssueDetailViewController: CommentDelegate {
    
    func addCommentButtonDidTap() {
        openAddView()
    }
    
}
