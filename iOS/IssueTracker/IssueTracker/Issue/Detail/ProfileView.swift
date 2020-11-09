//
//  ProfileView.swift
//  IssueTracker
//
//  Created by 김근수 on 2020/11/09.
//  Copyright © 2020 김근수. All rights reserved.
//

import UIKit

class ProfileView: UIView {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        let name = String(describing: ProfileView.self)
        guard let view = Bundle.main.loadNibNamed(name, owner: self, options: nil)?.first as? UIView  else { return }
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(view)
    }

}
