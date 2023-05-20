//
//  SaleSecondSectionCell.swift
//  SOPT-32nd-APP4-CarrotiOS
//
//  Created by 박윤빈 on 2023/05/20.
//

import UIKit

import SnapKit
import Then

class SaleSecondSectionCell: UITableViewCell {
    
    // MARK: - Properties
    static let identifier: String = "SaleSecondSectionCell"
    
    // MARK: - UI Components
    
    private let titleLabel = UILabel()
    private let categoryLabel = UILabel()
    private let uploadTimeLabel = UILabel()
    private let interestLabel = UILabel()
    private lazy var categoryTimeStackView = UIStackView(arrangedSubviews: [categoryLabel,
                                                                            uploadTimeLabel])
    private let contentTextView = UITextView()
    private let reportButton = UIButton()

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
    
    private func setUI() {
        
        titleLabel.do {
            $0.text = "스타벅스 다이어리 그린 9,000(쿠폰 없음)"
            $0.font = .title
            $0.textColor = .black
            $0.addLineHeight(lineHeight: 30)
        }
        
        categoryLabel.do {
            $0.text = "여성잡화"
            $0.textColor = Color.carrotGray4
            $0.font = .body4
            $0.addLineHeight(lineHeight: 10)
            $0.underlineText()
        }
        
        uploadTimeLabel.do {
            $0.text = "·  1분 전"
            $0.font = .body4
            $0.textColor = Color.carrotGray4
            $0.addLineHeight(lineHeight: 21)
        }
        
        categoryTimeStackView.do {
            $0.axis = .horizontal
            $0.spacing = 2
            $0.alignment = .center
        }
        
        interestLabel.do {
            $0.text = "관심 3  · 조회   309"
            $0.font = .body4
            $0.textColor = Color.carrotGray4
            $0.addLineHeight(lineHeight: 21)
        }
        
        
        
    }
    
    private func setLayout() {
        
    }

}
