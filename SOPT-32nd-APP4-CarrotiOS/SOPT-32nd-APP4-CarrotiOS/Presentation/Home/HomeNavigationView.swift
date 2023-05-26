//
//  HomeNavigationView.swift
//  SOPT-32nd-APP4-CarrotiOS
//
//  Created by kyun on 2023/05/19.
//

import UIKit

import SnapKit
import Then

final class HomeNavigationView: UIView {
    
    private let dongLabel = UILabel()
    private let listButton = UIButton()
    private let searchButton = UIButton()
    private let menuButton = UIButton()
    private let bellButton = UIButton()
    private let rightStackView = UIStackView()
    private let bottomBorderView = UIView()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeNavigationView {
    
    private func setUI() {
        
        self.backgroundColor = Color.carrotWhite
        
        dongLabel.do {
            $0.text = "동교동"
            $0.font = .title
            $0.addLineHeight(lineHeight: 25)
        }
        
        listButton.do {
            $0.setImage(Image.homeListIcon, for: .normal)
        }
        
        searchButton.do {
            $0.setImage(Image.homeSearchIcon, for: .normal)
        }
        
        menuButton.do {
            $0.setImage(Image.homeMenuIcon, for: .normal)
        }
        
        bellButton.do {
            $0.setImage(Image.homeBellIcon, for: .normal)
        }
        
        rightStackView.do {
            $0.axis = .horizontal
            $0.spacing = 13
        }
        
        bottomBorderView.do {
            $0.backgroundColor = Color.carrotGray3
        }
    }
    
    private func setLayout() {
        self.addSubviews(dongLabel, listButton, searchButton, menuButton, bellButton, rightStackView, bottomBorderView)
        
        dongLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(24)
            $0.bottom.equalToSuperview().inset(9)
        }
        
        listButton.snp.makeConstraints {
            $0.leading.equalTo(dongLabel.snp.trailing).offset(2)
            $0.bottom.equalToSuperview().inset(9)
        }
        
        searchButton.snp.makeConstraints {
            $0.size.equalTo(25)
        }
        
        menuButton.snp.makeConstraints {
            $0.size.equalTo(25)
        }
        
        bellButton.snp.makeConstraints {
            $0.size.equalTo(25)
        }
        
        rightStackView.addArrangedSubviews(searchButton, menuButton, bellButton)
        
        rightStackView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(19)
            $0.bottom.equalToSuperview().inset(10)
            $0.height.equalTo(25)
        }
        
        bottomBorderView.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.top.equalToSuperview().offset(43)
            $0.leading.trailing.equalToSuperview()
        }
        
        self.snp.makeConstraints {
            $0.height.equalTo(44)
        }
    }
    
    func addBottomBorder(with color: UIColor?, andWidth borderWidth: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
        border.frame = CGRect(x: 0, y: frame.height, width: self.frame.width, height: borderWidth)
        self.addSubview(border)
    }
}
