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
    
    lazy var inputTextField = UITextField().then {
        $0.placeholder = "메시지 보내기"
        $0.setPlaceholderColor(Color.carrotGray3!)
        $0.layer.cornerRadius = 21
        $0.clipsToBounds = true
        $0.backgroundColor = Color.carrotGray1
        $0.textColor = .black
        $0.font = .body2
        $0.addLeftPadding(12)
        $0.addRightPadding(39)
        $0.tintColor = Color.carrotOrange
        $0.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    let emojiButton = UIButton().then {
        $0.setImage(Image.chatEmojiIcon, for: .normal)
    }
    
    lazy var sendButton = UIButton().then {
        $0.setImage(Image.chatSendIcon, for: .normal)
        $0.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
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
    
    @objc func sendButtonTapped() {

        if let text = inputTextField.text {
            let nowDate = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "a hh:mm"
            dateFormatter.locale = Locale(identifier: "ko")
            let str = dateFormatter.string(from: nowDate)

            let chatViewController = ChatViewController()
            chatViewController.userIdOrder.append(1)
            chatViewController.chatContentOrder.append(text)
            chatViewController.chatTimeOrder.append(str)
        }
    }
}

extension ChatInputView: UITextFieldDelegate {

    @objc func textFieldDidChange(_ textField: UITextField) {
        // 키보드 업데이트 시 원하는 기능
        if inputTextField.hasText {
            sendButton.setImage(Image.chatSendIconOrange, for: .normal)
        } else {
            sendButton.setImage(Image.chatSendIcon, for: .normal)
        }
    }
}
