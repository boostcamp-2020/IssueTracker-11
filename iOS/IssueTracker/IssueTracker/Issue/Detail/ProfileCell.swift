//
//  ProfileView.swift
//  IssueTracker
//
//  Created by 김근수 on 2020/11/09.
//  Copyright © 2020 김근수. All rights reserved.
//

import UIKit

class ProfileCell: UICollectionViewCell {
    
    static let reuseIdentifier = "ProfileCell"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func configure(image: UIImage, name: String) {
        imageView.image = image
        nameLabel.text = name
    }
}
