//
//  HomeViewController.swift
//  SOPT-32nd-APP4-CarrotiOS
//
//  Created by kyun on 2023/05/19.
//

import UIKit

import SnapKit
import Then

class HomeViewController: UIViewController {
    
    let homeHeaderView = HomeHeaderView()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setUI()
        setLayout()
    }
}

private extension HomeViewController {
    
    private func setUI() {
        
        view.backgroundColor = Color.carrotWhite
    }
    
    private func setLayout() {
        
        view.addSubview(homeHeaderView)

        homeHeaderView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(44)
            $0.horizontalEdges.equalTo(self.view.safeAreaLayoutGuide)
            $0.height.equalTo(44)
        }
    }
}
