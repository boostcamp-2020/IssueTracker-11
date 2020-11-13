//
//  ProfileView.swift
//  IssueTracker
//
//  Created by 김근수 on 2020/11/09.
//  Copyright © 2020 김근수. All rights reserved.
//

import UIKit

final class ProfileCell: UICollectionViewCell {
    
    static let reuseIdentifier = "ProfileCell"
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    
    func configure(user: User?) {
//        imageView.image = image
        nameLabel.text = user?.nickname
    }
}
