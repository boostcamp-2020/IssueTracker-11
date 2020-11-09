//
//  IssueInfoViewController.swift
//  IssueTracker
//
//  Created by 김근수 on 2020/11/05.
//  Copyright © 2020 김근수. All rights reserved.
//

import UIKit

class IssueInfoViewController: PullUpController {
    
    
    @IBOutlet weak var buttonContainerView: UIView!
    @IBOutlet weak var infoContainerView: UIView!
    @IBOutlet weak var labelContainerView: UIView!
    
    @IBOutlet weak var assigneeContainerView: UIView!
    var initialPointOffset: CGFloat {
       return (buttonContainerView?.frame.height ?? 0) + safeAreaAdditionalOffset
    }
    
    public var portraitSize: CGSize = .zero
    public var landscapeFrame: CGRect = .zero
    
    private var safeAreaAdditionalOffset: CGFloat {
        return 20
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        portraitSize = CGSize(width: min(UIScreen.main.bounds.width, UIScreen.main.bounds.height),
                              height: UIScreen.main.bounds.height * 0.9)
        landscapeFrame = CGRect(x: 5, y: 50, width: 400, height: 300)
        
        configureLabelView()
        configureAssigneeView()
    }
    
    override var pullUpControllerPreferredSize: CGSize {
        return portraitSize
    }
    
    override var pullUpControllerPreferredLandscapeFrame: CGRect {
        return landscapeFrame
    }
    
    override var pullUpControllerBounceOffset: CGFloat {
        return 20
    }
    
    override func pullUpControllerAnimate(action: PullUpController.Action,
                                          withDuration duration: TimeInterval,
                                          animations: @escaping () -> Void,
                                          completion: ((Bool) -> Void)?) {
        switch action {
        case .move:
            UIView.animate(withDuration: 0.3,
                           delay: 0,
                           usingSpringWithDamping: 0.7,
                           initialSpringVelocity: 0,
                           options: .curveEaseInOut,
                           animations: animations,
                           completion: completion)
        default:
            UIView.animate(withDuration: 0.3,
                           animations: animations,
                           completion: completion)
        }
    }
 
}

extension IssueInfoViewController {
    
    func configureLabelView() {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        labelContainerView.addSubview(scrollView)
        scrollView.pinEdgesToSuperView()
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 15
        
        scrollView.addSubview(stackView)
        stackView.pinEdgesToSuperView()

        (1...10).forEach {
            let label = BadgeLabel()
            label.text = "TestTestTest\($0)"
            label.backgroundColor = .yellow
            label.borderColor = .yellow
            label.borderWidth = 1
            label.layer.masksToBounds = true
            label.cornerRadius = 10
            stackView.addArrangedSubview(label)
        }
    }
    
    func configureAssigneeView() {
        let width = assigneeContainerView.frame.width / 6
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        assigneeContainerView.addSubview(scrollView)
        scrollView.pinEdgesToSuperView()
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 15
        
        scrollView.addSubview(stackView)
        stackView.pinEdgesToSuperView()
        
        (1...3).forEach {
            _ = $0
            let profileView = ProfileView()
            profileView.nameLabel.textColor = .black
            
            NSLayoutConstraint.activate([
                profileView.widthAnchor.constraint(equalToConstant: width),
                profileView.heightAnchor.constraint(equalToConstant: width * 1.2)
            ])
            stackView.addArrangedSubview(profileView)
        }
    }
}
