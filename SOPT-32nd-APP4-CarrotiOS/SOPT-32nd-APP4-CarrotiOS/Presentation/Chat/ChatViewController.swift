//
//  ChatViewController.swift
//  SOPT-32nd-APP4-CarrotiOS
//
//  Created by 정채은 on 2023/05/16.
//

import UIKit

import SnapKit
import Then

final class ChatViewController: UIViewController {
    
    //MARK: Components
    let headerView = HeaderView()
    
    private let headerViewTitle = UILabel().then {
        $0.font = .title
        $0.text = "마포아씨"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setLayout()
    }
}

extension ChatViewController {
    private func setStyle() {
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        view.addSubviews(headerView)
         headerView.addSubviews(headerViewTitle)
         
         headerView.snp.makeConstraints {
             $0.top.equalToSuperview().offset(44)
             $0.horizontalEdges.equalTo(self.view.safeAreaLayoutGuide)
             $0.height.equalTo(44)
         }
         headerViewTitle.snp.makeConstraints {
             $0.centerY.equalToSuperview()
             $0.centerX.equalToSuperview()
         }
    }
}
