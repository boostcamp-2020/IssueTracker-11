//
//  LoginViewController.swift
//  IssueTracker
//
//  Created by 김근수 on 2020/11/10.
//  Copyright © 2020 김근수. All rights reserved.
//

import UIKit
import AuthenticationServices

class LoginViewController: UIViewController {

    // MARK: - IBOutlet
    
    @IBOutlet weak var githubLoginButton: UIButton!
    @IBOutlet weak var appleLoginButtonContainer: UIView!
    
    // MARK: - Properties
    
    private var appleLoginButton = ASAuthorizationAppleIDButton(type: .signIn, style: .black)
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        congiureAppleLoginButton()
        registerButtonActions()
    }
    
    // MARK: - Methods
    
    private func congiureAppleLoginButton() {
        appleLoginButtonContainer.addSubview(appleLoginButton)
        appleLoginButton.pinEdgesToSuperView()
    }
    
    private func registerButtonActions() {
        appleLoginButton.addTarget(self,
                                   action: #selector(appleLogin),
                                   for: .touchUpInside)
    }
    
    // MARK: - Objc
    
    @objc fileprivate func appleLogin() {
            
        let appleIdRequest = ASAuthorizationAppleIDProvider().createRequest()
        appleIdRequest.requestedScopes = [.email, .fullName]

        let controller = ASAuthorizationController(authorizationRequests: [appleIdRequest])
        controller.delegate = self
        controller.presentationContextProvider = self
        controller.performRequests()
    }

}

extension LoginViewController: ASAuthorizationControllerDelegate {
    
}

extension LoginViewController: ASAuthorizationControllerPresentationContextProviding {
    
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        guard let window = self.view.window else { return UIWindow() }
        return window
    }
    
}
