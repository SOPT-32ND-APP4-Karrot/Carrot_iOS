//
//  ReviewViewController.swift
//  SOPT-32nd-APP4-CarrotiOS
//
//  Created by 정채은 on 2023/05/26.
//

import UIKit

import SnapKit
import Then

final class ReviewViewController: UIViewController {
    
    let headerView = HeaderView()
    
    let scrollView = UIScrollView()
    
    let reviewView = ReviewView()
    
    lazy var headerViewTitle = UILabel().then {
        $0.font = .title
        $0.addLineHeight(lineHeight: 28)
        $0.text = "거래 후기"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setLayout()
        setDelegate()
    }
}

extension ReviewViewController {
    
    private func setStyle() {
        view.backgroundColor = .white
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func setDelegate() {
        headerView.handleBackButtonDelegate = self
    }
    
    private func setLayout() {
        view.addSubviews(
            headerView,
            scrollView
        )
        
        headerView.addSubviews(headerViewTitle)
        scrollView.addSubview(reviewView)
        
        headerView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(44)
            $0.horizontalEdges.equalTo(self.view.safeAreaLayoutGuide)
            $0.height.equalTo(44)
        }
        
        headerViewTitle.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        scrollView.snp.makeConstraints{
            $0.top.equalTo(headerView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        reviewView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        
        }
    }
}

extension ReviewViewController: HandleBackButtonDelegate {
    func popView() {
        self.navigationController?.popViewController(animated: true)
    }
}
