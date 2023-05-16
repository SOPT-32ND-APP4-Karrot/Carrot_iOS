//
//  HeaderView.swift
//  SOPT-32nd-APP4-CarrotiOS
//
//  Created by 정채은 on 2023/05/16.
//

import UIKit

import SnapKit
import Then

protocol HandleBackButtonDelegate: AnyObject {
    func popView()
}

class HeaderView: UIView {
    
    // MARK: Variables
    weak var handleBackButtonDelegate: HandleBackButtonDelegate?
    
    // MARK: Component
    private let backButton = UIButton().then {
        $0.setImage(Image.chatArrowLeftIcon, for: .normal)
    }
    
    let moreButton = UIButton().then {
        $0.setImage(Image.chatMoreIcon, for: .normal)
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
extension HeaderView {
    private func setUI() {
        self.backgroundColor = .white
        addBottomBorder(with: Color.carrotGray2, andWidth: 0.4)
    }
    
    private func setLayout() {
        self.addSubviews(
            backButton,
            moreButton
        )
        
        self.snp.makeConstraints {
            $0.width.equalTo(UIScreen.main.bounds.size.width)
            $0.height.equalTo(44)
        }
        
        backButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(22)
        }
        
        moreButton.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(20)
        }
    }
    
    private func setAddTarget() {
        backButton.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
    }
    
    @objc
    private func backButtonDidTap() {
        self.handleBackButtonDelegate?.popView()
    }
    
    func addBottomBorder(with color: UIColor?, andWidth borderWidth: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
        border.frame = CGRect(x: 0, y: frame.height, width: self.frame.width, height: borderWidth)
        self.addSubview(border)
    }
}
