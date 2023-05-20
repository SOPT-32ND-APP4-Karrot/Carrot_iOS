//
//  ChatInputView.swift
//  SOPT-32nd-APP4-CarrotiOS
//
//  Created by 정채은 on 2023/05/20.
//

import UIKit

import SnapKit
import Then

final class ChatInputView: BaseView {
    
    lazy var plusButton = UIButton().then {
        $0.setImage(Image.chatAddIcon, for: .normal)
    }
    
    let inputTextField = UITextField().then {
        $0.placeholder = "메시지 보내기"
        $0.setPlaceholderColor(Color.carrotGray3!)
        $0.layer.cornerRadius = 21
        $0.clipsToBounds = true
        $0.backgroundColor = Color.carrotGray1
        $0.textColor = .black
        $0.font = .body2
    }
    
    let emojiButton = UIButton().then {
        $0.setImage(Image.chatEmojiIcon, for: .normal)
    }
    
    let sendButton = UIButton().then {
        $0.setImage(Image.chatSendIcon, for: .normal)
    }
    
    override func setUI() {
        self.backgroundColor = .white
    }
    
    override func setLayout() {
        self.addSubviews(plusButton, inputTextField, sendButton)
        
        inputTextField.addSubviews(emojiButton)
        
        self.snp.makeConstraints {
            $0.height.equalTo(91)
            $0.width.equalTo(UIScreen.main.bounds.size.width)
        }
        
        plusButton.snp.makeConstraints{
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview().offset(10)
        }
        
        inputTextField.snp.makeConstraints{
            $0.top.equalToSuperview().offset(9)
            $0.leading.equalTo(plusButton.snp.trailing).offset(10)
            $0.trailing.equalToSuperview().inset(48)
            $0.height.equalTo(42)
        }
        
        emojiButton.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(9)
        }
        
        sendButton.snp.makeConstraints{
            $0.top.equalTo(plusButton)
            $0.trailing.equalToSuperview().inset(11.53)
        }
        
    }

}
