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
    private let backButton: UIButton = UIButton().then {
        $0.setImage(Image.chatArrowLeftIcon, for: .normal)
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

extension HeaderView {
    private func setUI() {
        self.backgroundColor = .white
    }
    
    private func setLayout() {
        self.addSubview(
            backButton
        )
        
        self.snp.makeConstraints {
            $0.width.equalTo(UIScreen.main.bounds.size.width)
            $0.height.equalTo(44)
        }
        
        backButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(22)
            $0.width.height.equalTo(32)
        }
    }
    
    private func setAddTarget() {
        backButton.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
    }
    
    @objc
    private func backButtonDidTap() {
        self.handleBackButtonDelegate?.popView()
    }
}
