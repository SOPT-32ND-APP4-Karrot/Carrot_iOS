//
//  ReceiveView.swift
//  SOPT-32nd-APP4-CarrotiOS
//
//  Created by 정채은 on 2023/05/19.
//

import UIKit

import SnapKit
import Then

class ReceiveView: BaseView {
    lazy var profileImage = UIImageView().then {
        $0.image = Image.chatProfileIcon
        $0.isHidden = false
    }
    
    private let messageView = UIView().then{
        $0.makeRounded(radius: 20)
        $0.backgroundColor = Color.carrotGray1
    }
    
    let receiveLabel = UILabel().then {
        $0.setTextWithLineHeight(text:  "광흥창역 1번출구에서 저녁6시\n45분 괜찮으실까요?", lineHeight: 22)
        $0.numberOfLines = 0
        $0.font = .body5
        $0.textAlignment = .left
    }
    
    let timeLabel = UILabel().then {
        $0.setTextWithLineHeight(text: "오후 12:22", lineHeight: 22)
        $0.font = .detail2
        $0.textColor = Color.carrotGray3
    }
    
    
    override func setLayout() {
        self.addSubviews(profileImage, messageView, timeLabel)
        
        messageView.addSubview(receiveLabel)
        
        profileImage.snp.makeConstraints{
            $0.top.leading.equalToSuperview()
        }
        
        messageView.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.equalTo(profileImage.snp.trailing).offset(9)
            //TODO: 동적으로 설정
            $0.width.equalTo(193)
            $0.height.equalTo(63)
        }
        
        receiveLabel.snp.makeConstraints{
            $0.center.equalToSuperview()
        }
        
        timeLabel.snp.makeConstraints{
            $0.bottom.equalTo(messageView).inset(5)
            $0.leading.equalTo(messageView.snp.trailing).offset(4)
        }
    }
    
}
