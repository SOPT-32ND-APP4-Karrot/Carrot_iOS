//
//  ReviewView.swift
//  SOPT-32nd-APP4-CarrotiOS
//
//  Created by 정채은 on 2023/05/26.
//

import UIKit

import SnapKit
import Then

final class ReviewView: BaseView {
    
    lazy var sendLabel = UILabel().then {
        $0.font = .title
        $0.setTextWithLineHeight(text: "마포아씨님에게\n따뜻한 후기를 보냈어요.", lineHeight: 28)
        $0.textAlignment = .left
        $0.numberOfLines = 2
    }

    let sendImageView = UIImageView().then {
        $0.image = Image.reviewSendImage
    }
    
    let sendReviewView = UIView().then {
        $0.backgroundColor = Color.carrotMint
        $0.layer.cornerRadius = 10
        $0.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        $0.layer.masksToBounds = true
    }
    
    let sendReviewLabel = UILabel().then {
        $0.font = .body2
        $0.setTextWithLineHeight(text: " · 시간 약속을 잘 지켜요.\n · 친절하고 매너가 좋아요.\n · 응답이 빨라요.", lineHeight: 27.2)
        $0.numberOfLines = 0
    }
    
    lazy var receiveLabel = UILabel().then {
        $0.font = .title
        $0.setTextWithLineHeight(text: "마포아씨님이 보낸\n따뜻한 후기가 도착했어요.", lineHeight: 28)
        $0.textAlignment = .left
        $0.numberOfLines = 2
    }
    
    let receiveImageView = UIImageView().then {
        $0.image = Image.reviewReceiveImage
    }
    
    let receiveReviewView = UIView().then {
        $0.backgroundColor = Color.carrotLightYellow
        $0.layer.cornerRadius = 10
        $0.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        $0.layer.masksToBounds = true
    }
    
    let receiveReviewLabel = UILabel().then {
        $0.font = .body2
        $0.setTextWithLineHeight(text: " · 시간 약속을 잘 지켜요.\n · 친절하고 매너가 좋아요.\n · 응답이 빨라요.", lineHeight: 27.2)
        $0.numberOfLines = 0
    }
    
    lazy var mannerButton = UIButton().then {
        $0.setTitle("내 매너 평가 보기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel!.font = .title
        
        $0.titleLabel!.setTextWithLineHeight(text: "", lineHeight: 28)
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
        $0.backgroundColor = Color.carrotOrange
    }
    
    
    override func setLayout() {
        self.addSubviews(
            sendLabel,
            sendImageView,
            sendReviewView,
            receiveLabel,
            receiveImageView,
            receiveReviewView,
            mannerButton
        )
        
        sendReviewView.addSubview(sendReviewLabel)
        receiveReviewView.addSubview(receiveReviewLabel)
        
        self.snp.makeConstraints{
            $0.height.equalTo(UIScreen.main.bounds.size.height)
            $0.width.equalTo(UIScreen.main.bounds.size.width)
        }
        
        
        sendLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(27)
            $0.leading.equalToSuperview().offset(16)
        }
        
        sendImageView.snp.makeConstraints{
            $0.top.equalTo(sendLabel.snp.bottom).offset(12)
            $0.height.equalTo(137)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.centerX.equalToSuperview()
        }
        
        sendReviewView.snp.makeConstraints{
            $0.top.equalTo(sendImageView.snp.bottom)
            $0.width.equalTo(sendImageView)
            $0.height.equalTo(127)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.centerX.equalToSuperview()
        }
        
        sendReviewLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(12)
        }
        
        receiveLabel.snp.makeConstraints{
            $0.top.equalTo(sendReviewView.snp.bottom).offset(50)
            $0.leading.equalToSuperview().offset(16)
        }
        
        receiveImageView.snp.makeConstraints{
            $0.top.equalTo(receiveLabel.snp.bottom).offset(12)
            $0.height.equalTo(137)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.centerX.equalToSuperview()
        }
        
        receiveReviewView.snp.makeConstraints{
            $0.top.equalTo(receiveImageView.snp.bottom)
            $0.width.equalTo(receiveImageView)
            $0.height.equalTo(127)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.centerX.equalToSuperview()
        }
        
        receiveReviewLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(12)
        }
        
        mannerButton.snp.makeConstraints{
            $0.top.equalTo(receiveReviewView.snp.bottom).offset(60)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(49)
        }
    }
    
}
