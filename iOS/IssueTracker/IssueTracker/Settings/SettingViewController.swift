//
//  SettingViewController.swift
//  IssueTracker
//
//  Created by 김근수 on 2020/11/12.
//  Copyright © 2020 김근수. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func logoutButtonDidTap(_ sender: UIButton) {
        UserDefaults.standard.removeObject(forKey: "user")
        
        let id = String(describing: LoginViewController.self)
        let rootViewController = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: id)
        self.view.window?.rootViewController = rootViewController
    }
    
}
