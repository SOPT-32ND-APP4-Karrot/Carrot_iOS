//
//  BaseViewController.swift
//  SOPT-32nd-APP4-CarrotiOS
//
//  Created by kyun on 2023/05/15.
//

import UIKit

class BaseViewController: UIViewController, UIGestureRecognizerDelegate {
    
    // MARK: - Properties
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        activityIndicator.center = view.center
        
        // 기타 옵션
        activityIndicator.color = .gray
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .medium
        activityIndicator.stopAnimating()
        return activityIndicator
    }()
    
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.addSubview(activityIndicator)
        
        setUI()
        setLayout()
    }
    
    func setUI() {}
    
    func setLayout() {}
}

// MARK: - Custom Methods

extension BaseViewController {
    
    func hideTabBar() {
        
        self.tabBarController?.tabBar.isHidden = true
    }
    
    func showTabBar() {
        
        self.tabBarController?.tabBar.isHidden = false
    }
}

// MARK: - Custom Methods(화면전환)

extension BaseViewController {
    
    /// 특정 탭의 루트 뷰컨으로 이동시키는 메서드
    func goToRootOfTab(index: Int) {
        
        tabBarController?.selectedIndex = index
        
        if let nav = tabBarController?.viewControllers?[index] as? UINavigationController {
            nav.popToRootViewController(animated: true)
        }
    }
}
