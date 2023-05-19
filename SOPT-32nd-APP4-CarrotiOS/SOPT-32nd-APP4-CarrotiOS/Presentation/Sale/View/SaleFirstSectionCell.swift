//
//  SaleFirstSectionCell.swift
//  SOPT-32nd-APP4-CarrotiOS
//
//  Created by 박윤빈 on 2023/05/20.
//

import UIKit

import SnapKit
import Then

class SaleFirstSectionCell: UITableViewCell {
    
    static let identifier: String = "SaleFirstSectionCell"
    
    // MARK: - UI Components
    
    private let userProfileImage = UIImageView()
    private let userNicknameLabel = UILabel()
    private let userLocationLabel = UILabel()
    private lazy var userInfoStackView = UIStackView(arrangedSubviews: [userNicknameLabel,
                                                                        userLocationLabel])
    private let userMannerLabel = UILabel()
    private let userMannerProgressView = UIProgressView(progressViewStyle: .default)
    private let mannerLabel = UILabel()
    private lazy var mannerStackView = UIStackView(arrangedSubviews: [userMannerLabel,
                                                                      userMannerProgressView,
                                                                      mannerLabel])
    

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
    
    private func setUI() {
        
        userProfileImage.do {
            $0.image = Image.saleProfileIcon
        }
        
        userNicknameLabel.do {
            $0.text = "마포아씨"
            $0.font = .body1
            $0.addLineHeight(lineHeight: 22)
            $0.textColor = .black
        }
        
        userLocationLabel.do {
            $0.text = "서강동"
            $0.font = .body5
            $0.addLineHeight(lineHeight: 22)
            $0.textColor = Color.carrotGray5
        }
        
        userInfoStackView.do {
            $0.axis = .vertical
            $0.spacing = 3
            $0.alignment = .leading
        }
        
        userMannerLabel.do {
            $0.text = "40.4℃"
            $0.font = .number1
            $0.textColor = Color.carrotGreen
            $0.addLineHeight(lineHeight: 17)
        }
        
        userMannerProgressView.do {
            $0.progress = 0.5
            $0.progressTintColor = Color.carrotGreen
            $0.trackTintColor = Color.carrotGray2
            $0.progress = 0.7
        }
        
        mannerLabel.do {
            $0.text = "매너온도"
            $0.font = .body7
            $0.textColor = Color.carrotGray4
            $0.underlineText()
            $0.addLineHeight(lineHeight: 22)
        }
        
        mannerStackView.do {
            $0.axis = .vertical
            $0.spacing = 4
            $0.alignment = .trailing
        }
        
    }
    
    private func setLayout() {
        contentView.addSubviews(userProfileImage,
                                userInfoStackView,
                                mannerStackView)
        
        userProfileImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
            $0.height.width.equalTo(49)
        }
        
        userInfoStackView.snp.makeConstraints {
            $0.leading.equalTo(userProfileImage.snp.trailing).offset(7)
            $0.centerY.equalTo(userProfileImage)
        }
        
        userMannerProgressView.snp.makeConstraints {
            $0.height.equalTo(4)
            $0.width.equalTo(50)
        }
        
        mannerStackView.snp.makeConstraints {
            $0.centerY.equalTo(userProfileImage)
            $0.trailing.equalToSuperview().inset(16)
        }
    }
}
