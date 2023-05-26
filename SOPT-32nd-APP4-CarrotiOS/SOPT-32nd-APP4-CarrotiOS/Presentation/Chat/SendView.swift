//
//  SendView.swift
//  SOPT-32nd-APP4-CarrotiOS
//
//  Created by 정채은 on 2023/05/19.
//

import UIKit

import SnapKit
import Then

class SendView: BaseView {
    
    private let messageView = UIView().then{
        $0.makeRounded(radius: 20)
        $0.backgroundColor = Color.carrotOrange
    }
    
    let receiveLabel = UILabel().then {
        $0.setTextWithLineHeight(text:  "네 그럼 그시간 쯤 뵐게요 😍", lineHeight: 22)
        $0.numberOfLines = 0
        $0.font = .body5
        $0.textAlignment = .right
        $0.textColor = .white
    }
    
    let timeLabel = UILabel().then {
        $0.setTextWithLineHeight(text: "오후 12:22", lineHeight: 22)
        $0.font = .detail2
        $0.textColor = Color.carrotGray3
    }
    
    
    override func setLayout() {
        self.addSubviews(messageView, timeLabel)
        
        messageView.addSubview(receiveLabel)
        
        self.snp.makeConstraints {
            $0.width.equalTo(UIScreen.main.bounds.size.width)
            //TODO: 동적으로 설정
            $0.height.equalTo(38)
        }
        
        messageView.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(38)
        }
        
        receiveLabel.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.centerY.equalToSuperview()
        }
        
        timeLabel.snp.makeConstraints{
            $0.bottom.equalTo(messageView).inset(5)
            $0.trailing.equalTo(messageView.snp.leading).offset(-4)
        }
    }
    
}
