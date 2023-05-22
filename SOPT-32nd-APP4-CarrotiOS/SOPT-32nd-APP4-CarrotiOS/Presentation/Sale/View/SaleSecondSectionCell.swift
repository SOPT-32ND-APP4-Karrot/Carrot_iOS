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
    private let categoryButton = UIButton()
    private let uploadTimeLabel = UILabel()
    private let interestLabel = UILabel()
    private lazy var categoryTimeStackView = UIStackView(arrangedSubviews: [categoryButton,
                                                                            uploadTimeLabel])
    private let contentLabel = UILabel()
    private let reportButton = UIButton()
    private let dealTipView = DealTipView()

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
        
        titleLabel.do {
            $0.text = "스타벅스 다이어리 그린 9,000(쿠폰 없음)"
            $0.font = .title
            $0.textColor = .black
            $0.addLineHeight(lineHeight: 30)
        }
        
        categoryButton.do {
            $0.setTitle("여성잡화", for: .normal)
            $0.setTitleColor(Color.carrotGray4, for: .normal)
            $0.titleLabel?.font = .body4
            $0.setUnderline()
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
        
        contentLabel.do {
            $0.text = "쿠폰 빼고 드려요\n직거래시 9,000(광흥창역, 광화문역등)\n택배거래시 택배비 발생합니다"
            $0.font = .body2
            $0.textColor = .black
            $0.addLineHeight(lineHeight: 22)
        }
        
        reportButton.do {
            $0.setTitle("이 게시글 신고하기", for: .normal)
            $0.setTitleColor(Color.carrotGray4, for: .normal)
            $0.titleLabel?.font = .body4
            $0.setUnderline()
        }
    }
    
    private func setLayout() {
        
    }

}
