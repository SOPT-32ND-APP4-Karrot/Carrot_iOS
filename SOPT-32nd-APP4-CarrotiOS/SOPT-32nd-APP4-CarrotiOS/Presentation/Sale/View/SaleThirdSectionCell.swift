//
//  SaleThirdSectionCell.swift
//  SOPT-32nd-APP4-CarrotiOS
//
//  Created by 박윤빈 on 2023/05/26.
//

import UIKit

import SnapKit
import Then

class SaleThirdSectionCell: UITableViewCell {

    // MARK: - Properties
    static let identifier: String = "SaleThirdSectionCell"

    // MARK: - UI Components
    private let recommandLabel = UILabel()
    private lazy var productImageView = UIImageView()
    private lazy var productNameLabel = UILabel()
    private let adLabel = UILabel()
    private lazy var shopNameLabel = UILabel()
    private lazy var adStackView = UIStackView(arrangedSubviews: [adLabel,
                                                                  shopNameLabel])
    private lazy var priceLabel = UILabel()
    private let optionButton = UIButton()
    private let buyNewLabel = UILabel()
    private let buyNewButton = UIButton()
    private lazy var buyNewStackView = UIStackView(arrangedSubviews: [buyNewLabel,
                                                                      buyNewButton])

    // MARK: - init
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style,
                   reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .white
        self.setUI()
        self.setLayout()
    }

    // MARK: - Functions
    private func setUI() {
        
        recommandLabel.do {
            $0.text = "혹시 이 상품 찾으시나요?"
            $0.font = .body1
            $0.textColor = .black
            $0.addLineHeight(lineHeight: 22)
        }
        
        productImageView.do {
            $0.image = Image.saleADImage
            $0.layer.cornerRadius = 5
        }
        
        productNameLabel.do {
            $0.text = "2023 스타벅스 다이어리, 플래너 프리퀀시"
            $0.numberOfLines = 2
            $0.font = .body2
            $0.textColor = .black
        }
        
        adLabel.do {
            $0.text = "광고"
            $0.font = .detail1
            $0.textColor = Color.carrotBlue
            $0.backgroundColor = Color.carrotLightSkyBlue
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 2
            $0.textAlignment = .center
            
        }
        
        shopNameLabel.do {
            $0.text = "도담도담샵"
            $0.font = .body4
            $0.textColor = Color.carrotGray4
            $0.addLineHeight(lineHeight: 21)
        }
        
        priceLabel.do {
            $0.text = "24,500원"
            $0.font = .body3
            $0.textColor = .black
            $0.addLineHeight(lineHeight: 22)
        }
        
        optionButton.do {
            $0.setImage(Image.saleMiddleListIcon, for: .normal)
        }
        
        buyNewLabel.do {
            $0.text = "새 상품 구매하기"
            $0.font = .body4
            $0.textColor = Color.carrotGray4
            $0.addLineHeight(lineHeight: 21)
        }
        
        adStackView.do {
            $0.axis = .horizontal
            $0.spacing = 4
            $0.alignment = .center
        }
        
        buyNewButton.do {
            $0.setImage(Image.saleNewProductIcon, for: .normal)
        }
        
        buyNewStackView.do {
            $0.axis = .horizontal
            $0.spacing = 0
            $0.alignment = .center
        }
        
    }

    private func setLayout() {
        contentView.addSubviews(recommandLabel,
                                productImageView,
                                productNameLabel,
                                adStackView,
                                priceLabel,
                                optionButton,
                                buyNewStackView)
        
        recommandLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(21)
            $0.leading.equalToSuperview().inset(15)
        }
        
        productImageView.snp.makeConstraints {
            $0.top.equalTo(recommandLabel.snp.bottom).offset(16)
            $0.leading.equalTo(recommandLabel)
            $0.height.width.equalTo(108)
        }
        
        productNameLabel.snp.makeConstraints {
            $0.top.equalTo(productImageView)
            $0.leading.equalTo(productImageView.snp.trailing).offset(17)
            $0.trailing.equalTo(optionButton.snp.leading)
        }
        
        adLabel.snp.makeConstraints {
            $0.height.equalTo(18)
            $0.width.equalTo(25)
        }
        
        adStackView.snp.makeConstraints {
            $0.top.equalTo(productNameLabel.snp.bottom).offset(2)
            $0.leading.equalTo(productNameLabel)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(adStackView.snp.bottom).offset(2)
            $0.leading.equalTo(productNameLabel)
        }
        
        optionButton.snp.makeConstraints {
            $0.top.equalTo(productNameLabel)
            $0.trailing.equalToSuperview().inset(11)
            $0.height.width.equalTo(24)
        }
        
        buyNewButton.snp.makeConstraints {
            $0.height.width.equalTo(24)
        }
        
        buyNewStackView.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(17)
            $0.trailing.equalToSuperview().inset(8)
        }
    }
}

