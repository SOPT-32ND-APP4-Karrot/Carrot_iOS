//
//  SaleFooterView.swift
//  SOPT-32nd-APP4-CarrotiOS
//
//  Created by 박윤빈 on 2023/05/26.
//

import UIKit

import SnapKit
import Then

class SaleFooterView: BaseView {
    
    // MARK: - UI Components
    private let heartButton = UIButton()
    private let lineView = UIView()
    private lazy var priceLabel = UILabel()
    private lazy var noDealLabel = UILabel()
    private let carrotPayImageView = UIImageView()
    private let chatButton = UIButton()
    private lazy var priceStackView = UIStackView(arrangedSubviews: [priceLabel,
                                                                     carrotPayImageView])
    
    override func setUI() {
        heartButton.do {
            $0.setImage(Image.filledHeartIcon, for: .selected)
            $0.setImage(Image.emptyHeartIcon, for: .normal)
        }
        
        lineView.do {
            $0.backgroundColor = Color.carrotGray2
        }
        
        priceLabel.do {
            $0.text = "9,000원"
            $0.font = .body1
            $0.textColor = .black
            $0.addLineHeight(lineHeight: 22)
        }
        
        noDealLabel.do {
            $0.text = "가격 제안 불가"
            $0.font = .body3
            $0.textColor = Color.carrotGray4
            $0.addLineHeight(lineHeight: 22)
        }
        
        carrotPayImageView.do {
            $0.image = Image.salePayImage
        }
        
        chatButton.do {
            $0.setTitle("채팅하기", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = .body1
            $0.backgroundColor = Color.carrotOrange
            $0.layer.cornerRadius = 10
            $0.clipsToBounds = true
        }
        
        priceStackView.do {
            $0.axis = .horizontal
            $0.spacing = 10
        }
    }
    
    override func setLayout() {
        
        self.addSubviews(heartButton,
                         lineView,
                         priceStackView,
                         noDealLabel,
                         chatButton)
        
        heartButton.snp.makeConstraints {
            $0.height.width.equalTo(32)
            $0.leading.equalToSuperview().inset(13)
            $0.top.equalToSuperview().inset(19)
        }
        
        carrotPayImageView.snp.makeConstraints {
            $0.height.equalTo(17)
            $0.width.equalTo(38)
        }
        
        lineView.snp.makeConstraints {
            $0.height.equalTo(40)
            $0.width.equalTo(1)
            $0.leading.equalTo(heartButton.snp.trailing).offset(12)
            $0.centerY.equalTo(heartButton)
        }
        
        priceStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.leading.equalTo(lineView.snp.trailing).offset(16)
        }
        
        noDealLabel.snp.makeConstraints {
            $0.leading.equalTo(priceStackView)
            $0.top.equalTo(priceStackView.snp.bottom)
        }
        
        chatButton.snp.makeConstraints {
            $0.height.equalTo(40)
            $0.width.equalTo(88)
            $0.centerY.equalTo(heartButton)
            $0.trailing.equalToSuperview().inset(16)
        }
    }
}


