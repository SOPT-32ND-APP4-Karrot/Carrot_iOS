//
//  SaleProductTableViewCell.swift
//  SOPT-32nd-APP4-CarrotiOS
//
//  Created by 박윤빈 on 2023/05/26.
//

import UIKit

import SnapKit
import Then

class SaleProductTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    static let identifier: String = "SaleProductTableViewCell"
    
    // MARK: - UI Components
    private let saleProductLabel = UILabel()
    private let seeDetailButton = UIButton()
    private lazy var saleProductCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: self.saleFlowLayout)
    
    let saleFlowLayout = UICollectionViewFlowLayout().then {
        $0.scrollDirection = .horizontal
    }
    
    // MARK: - init
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style,
                   reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .white
        self.setCollectionView()
        self.setUI()
        self.setLayout()
    }
    
    // MARK: - Functions
    private func setUI() {
        saleProductLabel.do {
            $0.text = "마포아씨님의 판매 상품"
            $0.font = .body1
            $0.textColor = .black
            $0.addLineHeight(lineHeight: 22)
        }
        
        seeDetailButton.do {
            $0.setImage(Image.saleSaleProductIcon, for: .normal)
        }
    }
    
    private func setLayout() {
        
        contentView.addSubviews(saleProductLabel,
                                seeDetailButton,
                                saleProductCollectionView)
        
        saleProductLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalToSuperview().inset(15)
        }
        
        seeDetailButton.snp.makeConstraints {
            $0.centerY.equalTo(saleProductLabel)
            $0.trailing.equalToSuperview().inset(14)
            $0.height.width.equalTo(24)
        }
        
        saleProductCollectionView.snp.makeConstraints {
            $0.top.equalTo(saleProductLabel.snp.bottom).offset(20)
            $0.height.equalTo(170)
            $0.leading.trailing.equalToSuperview().inset(15)
        }
        
    }
    
    private func setCollectionView() {
        self.saleProductCollectionView.backgroundColor = .white
        self.saleProductCollectionView.delegate = self
        self.saleProductCollectionView.dataSource = self
        self.saleProductCollectionView.register(SalerProductCollectionViewCell.self, forCellWithReuseIdentifier: SalerProductCollectionViewCell.identifier)
    }
}

extension SaleProductTableViewCell: UICollectionViewDelegate {}

extension SaleProductTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SalerProductCollectionViewCell.identifier, for: indexPath) as? SalerProductCollectionViewCell else { return UICollectionViewCell() }
        return cell
    }
}

extension SaleProductTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 163, height: 169)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
