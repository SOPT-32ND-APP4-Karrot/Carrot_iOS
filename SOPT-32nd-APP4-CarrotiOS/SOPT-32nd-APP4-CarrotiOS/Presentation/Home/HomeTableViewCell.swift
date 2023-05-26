//
//  HomeTableViewCell.swift
//  SOPT-32nd-APP4-CarrotiOS
//
//  Created by kyun on 2023/05/25.
//

import UIKit

import SnapKit
import Then

import Kingfisher

final class HomeTableViewCell: UITableViewCell {
    
    static let identifier = "HomeTableViewCell"
    
    private lazy var productImage = UIImageView()
    private let productLabel = UILabel()
    private let placeLabel = UILabel()
    private let timeLabel = UILabel()
    private let priceLabel = UILabel()
    private let priceDownImage = UIImageView()
    private let heartImage = UIImageView()
    private let heartCountLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func salesDataBind(datum: Datum) {
        
        productImage.kfSetImage(url: datum.saleImgURL)
        
        productLabel.text = datum.title
        placeLabel.text = datum.location + " · "
        
        if datum.isUpdated {
            placeLabel.text = datum.location + " · 끌올 "
        }
        
        timeLabel.text = datum.time
        
        if datum.saleID == 1 {
            placeLabel.text = "당근마켓 x 맹그로브 · "
            timeLabel.text = "순간이동"
        }
        
        priceLabel.text = datum.price.priceText
        
        if datum.isDiscount {
            priceDownImage.isHidden = false
        }
        
        if datum.likeCount > 0 {
            heartImage.isHidden = false
            heartCountLabel.isHidden = false
            
            if datum.isCheckLike {
                heartImage.image = Image.filledHeartIcon
            }
        }
    }
}

extension HomeTableViewCell {
    
    private func setUI() {
        
        productImage.do {
            $0.makeRounded(radius: 5)
            $0.backgroundColor = .black
        }
        
        productLabel.do {
            $0.font = .body2
            $0.addLineHeight(lineHeight: 22)
            $0.text = "이거 왜 이런 거임? 진짜 모름.."
            $0.numberOfLines = 0
        }
        
        placeLabel.do {
            $0.font = .body4
            $0.addLineHeight(lineHeight: 21)
            $0.textColor = Color.carrotGray4
            $0.text = "여기는 군자"
        }
        
        timeLabel.do {
            $0.font = .body4
            $0.addLineHeight(lineHeight: 21)
            $0.textColor = Color.carrotGray4
            $0.text = "저녁 먹을 시간 ㅋㅋ"
        }
        
        priceLabel.do {
            $0.font = .number1
            $0.addLineHeight(lineHeight: 21)
            $0.textColor = Color.carrotBlack
            $0.text = "50000원"
        }
        
        priceDownImage.do {
            $0.image = Image.homeDownDownIcon
            $0.isHidden = true
        }
        
        heartImage.do {
            $0.image = Image.emptyHeartIcon
            $0.isHidden = true
        }
        
        heartCountLabel.do {
            $0.font = .body4
            $0.addLineHeight(lineHeight: 21)
            $0.isHidden = true
            $0.text = "7"
        }
    }
    
    private func setLayout() {
        
        contentView.addSubviews(productImage, productLabel, placeLabel, timeLabel, priceLabel, priceDownImage, heartImage, heartCountLabel)
        
        productImage.snp.makeConstraints {
            $0.size.equalTo(108)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
        }
        
        productLabel.snp.makeConstraints {
            $0.top.equalTo(productImage.snp.top)
            $0.leading.equalTo(productImage.snp.trailing).offset(16)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        placeLabel.snp.makeConstraints {
            $0.top.equalTo(productLabel.snp.bottom).offset(4)
            $0.leading.equalTo(productLabel.snp.leading)
        }
        
        timeLabel.snp.makeConstraints {
            $0.top.equalTo(placeLabel.snp.top)
            $0.leading.equalTo(placeLabel.snp.trailing)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(placeLabel.snp.bottom).offset(4)
            $0.leading.equalTo(placeLabel.snp.leading)
        }
        
        priceDownImage.snp.makeConstraints {
            $0.width.equalTo(48)
            $0.height.equalTo(24)
            $0.top.equalTo(timeLabel.snp.bottom).offset(2)
            $0.leading.equalTo(priceLabel.snp.trailing).offset(-4)
        }
        
        heartImage.snp.makeConstraints {
            $0.size.equalTo(24)
            $0.trailing.equalToSuperview().inset(22)
            $0.bottom.equalToSuperview().inset(16)
        }
        
        heartCountLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(16)
        }
    }
}
