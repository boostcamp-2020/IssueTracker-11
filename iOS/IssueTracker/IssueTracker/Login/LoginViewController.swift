//
//  LoginViewController.swift
//  IssueTracker
//
//  Created by 김근수 on 2020/11/10.
//  Copyright © 2020 김근수. All rights reserved.
//

import UIKit
import AuthenticationServices

final class LoginViewController: UIViewController {

    // MARK: - IBOutlet
    
    @IBOutlet private weak var githubLoginButton: UIButton!
    @IBOutlet private weak var appleLoginButtonContainer: UIView!
    
    // MARK: - Properties
    
    private var appleLoginButton = ASAuthorizationAppleIDButton(type: .signIn, style: .black)
    private lazy var alertController: UIAlertController = {
       let alert = UIAlertController(title: "로그인 지원",
                                     message: "현재 Sign in with Apple만 가능합니다.",
                                     preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        return alert
    }()
    
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
    
    private func saveUser(user: User) -> Bool {
        print("Turn")
        guard let encoded = try? PropertyListEncoder().encode(user) else { return false }
        UserDefaults.standard.set(encoded, forKey: "user")
        return true
    }
    
    // MARK: - IBAction
    
    @IBAction func loginButtonDidtap(_ sender: UIButton) {
        self.present(alertController, animated: true)
    }
    @IBAction func signupButtonDidTap(_ sender: UIButton) {
        self.present(alertController, animated: true)
    }
    @IBAction func githubLoginButtonDidTap(_ sender: UIButton) {
        self.present(alertController, animated: true)
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
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        guard let credential = authorization.credential as? ASAuthorizationAppleIDCredential else { return }
        
        let userName = credential.fullName?.nickname
        let user = User(id: 0, nickname: userName)
        if saveUser(user: user) {
            let identifier = "MainTabBarController"
            let mainViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: identifier)
            self.view.window?.rootViewController = mainViewController
        }
    }

}
