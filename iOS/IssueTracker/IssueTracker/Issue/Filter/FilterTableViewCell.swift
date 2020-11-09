//
//  PlainFilterTableViewCell.swift
//  IssueTracker
//
//  Created by 김근수 on 2020/11/04.
//  Copyright © 2020 김근수. All rights reserved.
//

import UIKit

final class FilterTableViewCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet weak var checkImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        checkImageView.isHidden = !isSelected
    }
    
    func configure(title: String?) {
        self.titleLabel.text = title
        self.selectionStyle = .none
    }

}
