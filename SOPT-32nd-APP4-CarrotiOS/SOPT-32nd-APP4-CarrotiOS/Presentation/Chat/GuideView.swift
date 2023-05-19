//
//  GuideView.swift
//  SOPT-32nd-APP4-CarrotiOS
//
//  Created by 정채은 on 2023/05/19.
//

import UIKit

import SnapKit
import Then

class GuideView: BaseView {
    
    private let backgroundView = UIView().then {
        $0.backgroundColor = Color.carrotLightSkyBlue
        $0.makeRounded(radius: 11)
    }
    
    private let titleLabel = UILabel().then {
        $0.font = .body3
        $0.setTextWithLineHeight(text: "안내", lineHeight: 22)
        $0.textColor = Color.carrotBlue
    }
    
    private let guideLabel1 = UILabel().then {
        $0.font = .body5
        $0.setTextWithLineHeight(text: "마포아씨님과 거래 예약을 했어요. 당근페이에 가", lineHeight: 22)
        $0.textColor = Color.carrotBlue
    }
    
    private let guideLabel2 = UILabel().then {
        $0.font = .body5
        $0.setTextWithLineHeight(text: "입하면 간편하게 송금할 수 있어요.", lineHeight: 22)
        $0.textColor = Color.carrotBlue
    }
    
    private let detailButton = UIButton().then {
        $0.setTitle("자세히 보기", for: .normal)
        $0.setTitleColor(Color.carrotBlue, for: .normal)
        $0.titleLabel!.font = .body5
        $0.titleLabel!.setTextWithLineHeight(text: "", lineHeight: 22)
        $0.titleEdgeInsets = .init(top: 0, left: 0, bottom: -2, right: 0)
        $0.titleLabel!.underlineText()
    }
    
    override func setLayout() {
        self.addSubviews(backgroundView)
        
        backgroundView.addSubviews(
            titleLabel,
            guideLabel1,
            guideLabel2,
            detailButton)
        
        self.snp.makeConstraints {
            $0.height.equalTo(78)
            $0.width.equalTo(345)
        }
        
        backgroundView.snp.makeConstraints {
            $0.height.equalTo(78)
            $0.leading.trailing.equalToSuperview().inset(15)
        }
        
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(19)
            $0.leading.equalToSuperview().inset(20.12)
        }
        guideLabel1.snp.makeConstraints{
            $0.top.equalTo(titleLabel)
            $0.leading.equalTo(titleLabel.snp.trailing).inset(-6.04)
        }
        guideLabel2.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(-3)
            $0.leading.equalTo(titleLabel)
        }
        detailButton.snp.makeConstraints{
            $0.top.equalTo(guideLabel2)
            $0.leading.equalTo(guideLabel2.snp.trailing).inset(-4.02)
            $0.height.equalTo(22)
        }
    }
}
