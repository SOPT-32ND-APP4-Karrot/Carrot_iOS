//
//  SalerProductCollectionViewCell.swift
//  SOPT-32nd-APP4-CarrotiOS
//
//  Created by 박윤빈 on 2023/05/26.
//

import UIKit

import SnapKit
import Then

class SalerProductCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let identifier: String = "SalerProductCollectionViewCell"
    
    // MARK: - UI Components
    private lazy var productImageView = UIImageView()
    private lazy var productNameLabel = UILabel()
    private lazy var priceLabel = UILabel()
    private lazy var globalStackView = UIStackView(arrangedSubviews: [productImageView,
                                                                      productNameLabel,
                                                                      priceLabel])
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.setUI()
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    private func setUI() {
        
        productImageView.do {
            $0.image = Image.saleSalerProcudtImage
            $0.layer.cornerRadius = 5
            $0.contentMode = .scaleAspectFill
        }
        
        productNameLabel.do {
            $0.text = "스타벅스 써머콘페티 워터 텀블러"
            $0.font = .body5
            $0.textColor = .black
            $0.addLineHeight(lineHeight: 22)
            $0.numberOfLines = 1
        }
        
        priceLabel.do {
            $0.text = "10,000원"
            $0.font = .body3
            $0.textColor = .black
            $0.addLineHeight(lineHeight: 22)
        }
        
        globalStackView.do {
            $0.axis = .vertical
            $0.spacing = 5
            $0.alignment = .leading
        }
    }
    
    private func setLayout() {
        contentView.addSubview(globalStackView)
        
//        self.snp.makeConstraints{
//            $0.width.equalTo(UIScreen.main.bounds.size.width/2 - 5)
//            $0.height.equalTo(163)
//        }
        
        productImageView.snp.makeConstraints {
            $0.height.equalTo(122)
            $0.width.equalTo(163)
        }
        
        productNameLabel.snp.makeConstraints {
            $0.width.equalTo(productImageView)
        }
        
        globalStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
