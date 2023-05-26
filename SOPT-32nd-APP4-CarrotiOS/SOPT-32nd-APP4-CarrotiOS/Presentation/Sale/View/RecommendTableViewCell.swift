//
//  RecommendTableViewCell.swift
//  SOPT-32nd-APP4-CarrotiOS
//
//  Created by 박윤빈 on 2023/05/26.
//

import UIKit

import SnapKit
import Then

class RecommendTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    static let identifier: String = "RecommendTableViewCell"
    
    // MARK: - UI Components
    private let saleProductLabel = UILabel()
    private let buyNewLabel = UILabel()
    private let buyNewButton = UIButton()
    private lazy var buyNewStackView = UIStackView(arrangedSubviews: [buyNewLabel,
                                                                      buyNewButton])
    private lazy var saleProductCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: self.saleFlowLayout)
    
    let saleFlowLayout = UICollectionViewFlowLayout().then {
        $0.scrollDirection = .vertical
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
            $0.text = "이 글과 함께 봤어요"
            $0.font = .body1
            $0.textColor = .black
            $0.addLineHeight(lineHeight: 22)
        }
        
        buyNewLabel.do {
            $0.text = "추천 게시물 모두 보기"
            $0.font = .body4
            $0.textColor = Color.carrotGray4
            $0.addLineHeight(lineHeight: 21)
        }
        
        buyNewButton.do {
            $0.setImage(Image.saleNewProductIcon, for: .normal)
        }
        
        buyNewStackView.do {
            $0.axis = .horizontal
            $0.spacing = 0
            $0.alignment = .center
        }
        
        saleProductCollectionView.do {
            $0.isScrollEnabled = true
            $0.showsHorizontalScrollIndicator = false
        }
    }
    
    private func setLayout() {
        
        contentView.addSubviews(saleProductLabel,
                                buyNewStackView,
                                saleProductCollectionView)
        
        saleProductLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalToSuperview().inset(15)
        }
        
        buyNewStackView.snp.makeConstraints {
            $0.centerY.equalTo(saleProductLabel)
            $0.trailing.equalToSuperview().inset(8)
        }
        
        saleProductCollectionView.snp.makeConstraints {
            $0.top.equalTo(saleProductLabel.snp.bottom).offset(20)
            $0.height.equalTo(594)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        buyNewButton.snp.makeConstraints {
            $0.height.width.equalTo(24)
        }
        
    }
    
    private func setCollectionView() {
        self.saleProductCollectionView.backgroundColor = .white
        self.saleProductCollectionView.delegate = self
        self.saleProductCollectionView.dataSource = self
        self.saleProductCollectionView.register(SalerProductCollectionViewCell.self, forCellWithReuseIdentifier: SalerProductCollectionViewCell.identifier)
    }
}

extension RecommendTableViewCell: UICollectionViewDelegate {}

extension RecommendTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SalerProductCollectionViewCell.identifier, for: indexPath) as? SalerProductCollectionViewCell else { return UICollectionViewCell() }
        return cell
    }
}

extension RecommendTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 163, height: 171)
    }
    
    
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return
//    }
}
