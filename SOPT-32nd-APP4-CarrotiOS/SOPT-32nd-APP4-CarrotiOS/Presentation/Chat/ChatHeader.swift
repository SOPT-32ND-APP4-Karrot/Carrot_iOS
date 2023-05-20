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
        $0.image = Image.saleDiaryImage
        $0.layer.cornerRadius = 4
        $0.clipsToBounds = true
    }
    
    private let statusLabel = UILabel().then {
        $0.font = .body3
        $0.setTextWithLineHeight(text: "거래완료", lineHeight: 22)
    }
    
    private let productLabel = UILabel().then {
        $0.font = .body5
        $0.setTextWithLineHeight(text: "스타벅스 다이어리 그린 9,000(쿠폰없음)", lineHeight: 22)
    }
    
    private let priceLabel = UILabel().then {
        $0.font = .body3
        $0.setTextWithLineHeight(text: "9,000원", lineHeight: 22)
        
    }
    
    private let proposalLabel = UILabel().then {
        $0.font = .body5
        $0.setTextWithLineHeight(text: "(가격제안불가)", lineHeight: 22)
        $0.textColor = Color.carrotGray4!
    }
    
    private let reviewButton = UIButton().then {
        $0.setTitle("거래 후기 보기", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel!.font = .body6
        
        $0.titleLabel!.setTextWithLineHeight(text: "", lineHeight: 18)
        $0.titleLabel!.addLetterSpacing(0.02)
        $0.layer.cornerRadius = 3
        $0.clipsToBounds = true
        $0.layer.borderWidth = 1
        $0.layer.borderColor = Color.carrotGray2?.cgColor
        $0.setImage(Image.chatPenIcon, for: .normal)
        $0.titleEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: -4)
        $0.imageEdgeInsets = .init(top: 0, left: -4, bottom: 0, right: 0)
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

