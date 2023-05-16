//
//  ChatHeader.swift
//  SOPT-32nd-APP4-CarrotiOS
//
//  Created by 정채은 on 2023/05/16.
//

import UIKit

import SnapKit
import Then

class ChatHeader: UIView {
    
    // MARK: Component
    private let productImageView = UIImageView().then{
        $0.image = UIImage(named: "다이어리")
        $0.layer.cornerRadius = 4
    }
    
    private let statusLabel = UILabel().then {
        $0.font = .body3
        $0.text = "거래완료"
    }
    
    private let productLabel = UILabel().then {
        $0.font = .body5
        $0.text = "스타벅스 다이어리 그린 9,000(쿠폰없음)"
    }
    
    private let priceLabel = UILabel().then {
        $0.font = .body3
        $0.text = "9,000원"
    }
    
    private let proposalLabel = UILabel().then {
        $0.font = .body5
        $0.textColor = Color.carrotGray4!
        $0.text = "(가격제안불가)"
    }
    
    private let reviewButton = UIButton().then {
        $0.setTitle("거래 후기 보기", for: .normal)
        $0.titleLabel!.font = .body6
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 3
        $0.layer.borderWidth = 1
        $0.layer.borderColor = Color.carrotGray2?.cgColor
        $0.setImage(Image.chatPenIcon, for: .normal)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
        setAddTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - extension
extension ChatHeader {
    private func setUI() {
        self.backgroundColor = .white
        addBottomBorder(with: Color.carrotGray1, andWidth: 1.0)
    }
    
    private func setLayout() {
        
        self.addSubviews(
            productImageView,
            statusLabel,
            productLabel,
            priceLabel,
            proposalLabel,
            reviewButton)
        
        self.snp.makeConstraints {
            $0.width.equalTo(UIScreen.main.bounds.size.width)
            $0.height.equalTo(115)
        }
        
        productImageView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(18)
            $0.leading.equalToSuperview().offset(16)
            $0.width.height.equalTo(40)
        }
        statusLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalTo(productImageView.snp.trailing).offset(12)
        }
        productLabel.snp.makeConstraints{
            $0.top.equalTo(statusLabel)
            $0.leading.equalTo(statusLabel.snp.trailing).offset(2)
        }
        priceLabel.snp.makeConstraints{
            $0.top.equalTo(statusLabel.snp.bottom).offset(1)
            $0.leading.equalTo(productImageView.snp.trailing).offset(13)
        }
        proposalLabel.snp.makeConstraints{
            $0.top.equalTo(priceLabel)
            $0.leading.equalTo(priceLabel.snp.trailing).offset(4)
        }
        reviewButton.snp.makeConstraints{
            $0.top.equalTo(productImageView.snp.bottom).offset(10)
            $0.leading.equalTo(productImageView)
            $0.height.equalTo(30)
            $0.width.equalTo(112)
        }
    }
    
    private func setAddTarget() {
        
    }
    
    func addBottomBorder(with color: UIColor?, andWidth borderWidth: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
        border.frame = CGRect(x: 0, y: frame.height, width: self.frame.width, height: borderWidth)
        self.addSubview(border)
    }
}

