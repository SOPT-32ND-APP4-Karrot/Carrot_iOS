//
//  ChatViewController.swift
//  SOPT-32nd-APP4-CarrotiOS
//
//  Created by 정채은 on 2023/05/16.
//

import UIKit

import SnapKit
import Then

final class ChatViewController: UIViewController {
    
    var chat: [Chat] = []
    
    var dummy: [Int] = [1, 2, 1, 0, 2, 1, 2, 1, 1]
    
    //MARK: Components
    let headerView = HeaderView()
    
    let chatHeader = ChatHeader()
    
    let chatInputView = ChatInputView()
    
    private lazy var chatTableView = UITableView(frame: .zero, style: .plain).then {
        $0.register(ChatGuideTableViewCell.self, forCellReuseIdentifier: ChatGuideTableViewCell.identifier)
        $0.register(ChatReceiveTableViewCell.self, forCellReuseIdentifier: ChatReceiveTableViewCell.identifier)
        $0.register(ChatSendTableViewCell.self, forCellReuseIdentifier: ChatSendTableViewCell.identifier)
        $0.delegate = self
        $0.dataSource = self
        $0.backgroundColor = .clear
        $0.separatorStyle = .none
    }
    
    private let headerViewTitle = UILabel().then {
        $0.font = .title
        $0.addLineHeight(lineHeight: 28)
        $0.text = "마포아씨"
    }
    
    private let headerViewCallButton = UIButton().then {
        $0.setImage(Image.chatPhoneIcon, for: .normal)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setDelegate()
        setLayout()
        setKeyboardObserver()
        hideKeyboardWhenTappedAround()
        chatData()
    }
}

extension ChatViewController {
    
    private func setStyle() {
        view.backgroundColor = .white
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func setDelegate() {
        headerView.handleBackButtonDelegate = self
    }
    
    private func setLayout() {
        view.addSubviews(
            chatTableView,
            chatHeader,
            headerView,
            chatInputView
        )
        headerView.addSubviews(headerViewTitle, headerViewCallButton)
        
        headerView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(44)
            $0.horizontalEdges.equalTo(self.view.safeAreaLayoutGuide)
            $0.height.equalTo(44)
        }
        
        headerViewTitle.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        headerViewCallButton.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(headerView.moreButton.snp.leading).offset(-11)
        }
        
        chatHeader.snp.makeConstraints{
            $0.top.equalTo(headerView.snp.bottom)
            $0.horizontalEdges.equalTo(self.view.safeAreaLayoutGuide)
            $0.height.equalTo(115)
        }
        
        chatTableView.snp.makeConstraints{
            $0.top.equalTo(chatHeader.snp.bottom)
            $0.width.equalToSuperview()
            $0.bottom.equalTo(self.chatInputView.snp.top)
        }
        
        chatInputView.snp.makeConstraints{
            $0.bottom.equalToSuperview()
            $0.width.equalToSuperview()
        }
    }
    
    @objc override func keyboardWillShow(_ notification: NSNotification) {
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
            return
        }
        
        let keyboardHeight = keyboardFrame.height
        let intersection = keyboardFrame.intersection(view.frame)
        
        if intersection.height > 0 {
            if let textField = findFirstResponder() as? UITextField, let textFieldSuperview = textField.superview {
                let textFieldBottom = textFieldSuperview.convert(textField.frame, to: view).maxY
                let keyboardOverlap = keyboardHeight - (view.bounds.height - textFieldBottom)
                if keyboardOverlap > 0 && self.view.frame.origin.y == -304.0 {
                    print(self.view.frame.origin.y)
                    return
                }
            }
            let newTableViewHeight = self.view.bounds.height - headerView.frame.height - chatHeader.frame.height - chatInputView.frame.height - keyboardHeight
            chatTableView.frame.size.height = newTableViewHeight
            
            self.chatTableView.snp.makeConstraints{
                $0.top.equalTo(self.chatHeader.snp.bottom)
                $0.width.equalToSuperview()
                $0.bottom.equalTo(self.chatInputView.snp.top)
            }
            
            self.chatInputView.snp.makeConstraints{
                $0.bottom.equalToSuperview().inset(keyboardHeight - 32)
                $0.width.equalToSuperview()
            }
        }
    }
    
    @objc override func keyboardWillHide(_ notification: NSNotification) {
        
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
            return
        }
        let keyboardHeight = keyboardFrame.height
        self.chatInputView.frame.origin.y += keyboardHeight - 32
        
        self.chatInputView.snp.makeConstraints{
            $0.bottom.equalTo(self.view.snp.bottom)
            $0.width.equalToSuperview()
        }
        
        let newTableViewHeight = self.view.bounds.height - headerView.frame.height - chatHeader.frame.height - chatInputView.frame.height - 32
        chatTableView.frame.size.height = newTableViewHeight
    }
    
    
    private func chatData() {
        ChatService.shared.chat(chatRoomId: 1) { response in
            switch response {
            case .success(let data):
                guard let data = data as? Chat else { return }
                dump(data)
                self.chat.append(data)
                
                self.chatHeader.productImageView.kfSetImage(url: self.chat[0].data.sale.saleImgURL)
                self.chatHeader.statusLabel.text = String(self.chat[0].data.sale.status)
                self.chatHeader.productLabel.text = String(self.chat[0].data.sale.title)
                self.chatHeader.priceLabel.text = String(self.chat[0].data.sale.price.priceText)
                self.chatHeader.proposalLabel.text = self.chat[0].data.sale.isSuggest ? "" : "(가격제안불가)"
            default:
                return
            }
        }
        
    }
}

extension ChatViewController: HandleBackButtonDelegate {
    func popView() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch dummy[indexPath.row] {
        case 0:
            guard let guideCell = tableView.dequeueReusableCell(withIdentifier: ChatGuideTableViewCell.identifier, for: indexPath) as? ChatGuideTableViewCell else { return UITableViewCell() }
            guideCell.selectionStyle = .none
            return guideCell
        case 1:
            guard let receiveCell = tableView.dequeueReusableCell(withIdentifier: ChatReceiveTableViewCell.identifier, for: indexPath) as? ChatReceiveTableViewCell else { return UITableViewCell() }
            receiveCell.selectionStyle = .none
            return receiveCell
        case 2:
            guard let sendCell = tableView.dequeueReusableCell(withIdentifier: ChatSendTableViewCell.identifier, for: indexPath) as? ChatSendTableViewCell else { return UITableViewCell() }
            sendCell.selectionStyle = .none
            return sendCell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch dummy[indexPath.row] {
        case 0:
            return 90
        case 1:
            return 75
        case 2:
            return 50
        default:
            return 50
        }
    }
}
