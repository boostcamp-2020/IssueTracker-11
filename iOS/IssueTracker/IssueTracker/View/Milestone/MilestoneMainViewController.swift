//
//  MilestoneMainViewController.swift
//  IssueTracker
//
//  Created by 김근수 on 2020/11/02.
//  Copyright © 2020 김근수. All rights reserved.
//

import UIKit

class MilestoneMainViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
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
