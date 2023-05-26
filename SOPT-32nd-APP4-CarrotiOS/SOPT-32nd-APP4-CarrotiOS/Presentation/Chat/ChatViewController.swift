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
    
    var userIdOrder: [Int] = [] {
        didSet {
            self.chatTableView.reloadData()
        }
    }
    
    var chatContentOrder : [String] = []
    var chatTimeOrder: [String] = []
    
    //MARK: Components
    let headerView = HeaderView()
    
    let chatHeader = ChatHeader()
    
    let chatInputView = ChatInputView()
    
    lazy var chatTableView = UITableView(frame: .zero, style: .plain).then {
        $0.register(ChatGuideTableViewCell.self, forCellReuseIdentifier: ChatGuideTableViewCell.identifier)
        $0.register(ChatReceiveTableViewCell.self, forCellReuseIdentifier: ChatReceiveTableViewCell.identifier)
        $0.register(ChatSendTableViewCell.self, forCellReuseIdentifier: ChatSendTableViewCell.identifier)
        $0.delegate = self
        $0.dataSource = self
        $0.backgroundColor = .clear
        $0.separatorStyle = .none
    }
    
    lazy var headerViewTitle = UILabel().then {
        $0.font = .title
        $0.addLineHeight(lineHeight: 28)
        $0.text = "마포아씨"
    }
    
    private let headerViewCallButton = UIButton().then {
        $0.setImage(Image.chatPhoneIcon, for: .normal)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chatData()
        setStyle()
        setDelegate()
        setLayout()
        setKeyboardObserver()
        hideKeyboardTappedAround()
    }
}

extension ChatViewController {
    
    private func setStyle() {
        view.backgroundColor = .white
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func setDelegate() {
        headerView.handleBackButtonDelegate = self
        chatInputView.delegate = self
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
    
    func hideKeyboardTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tap.cancelsTouchesInView = false
        chatTableView.addGestureRecognizer(tap)
    }

    @objc func handleTap(_ gestureRecognizer: UITapGestureRecognizer) {
        let location = gestureRecognizer.location(in: chatTableView)
        let tappedView = chatTableView.hitTest(location, with: nil)
        
        // 특정 뷰를 터치한 경우 키보드를 내리지 않음
        guard tappedView != chatInputView else {
            return
        }
        
        // 특정 뷰 이외의 영역을 터치한 경우 키보드를 내림
        self.view.endEditing(true)
    }
    
    @objc override func keyboardWillHide(_ notification: NSNotification) {
        print("내려감")
        
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
       //TODO: 이전 뷰에서 RoomId 받아옴
        ChatService.shared.chat(chatRoomId: 2) { response in
            switch response {
            case .success(let data):
                guard let data = data as? Chat else { return }
                dump(data)
                self.chat.append(data)
                print(self.chat)

                if data.data.chatMessageList.count != 0 {
                    for i in 0...data.data.chatMessageList.count-1  {
                        self.userIdOrder.append(data.data.chatMessageList[i].writer.userID)
                        self.chatContentOrder.append(data.data.chatMessageList[i].content)
                        self.chatTimeOrder.append(data.data.chatMessageList[i].time)
                        
                        if data.data.chatMessageList[i].hasKeyword == true {
                            self.userIdOrder.append(0)
                            self.chatContentOrder.append("안내")
                            self.chatTimeOrder.append("0")
                        }
                        print(self.chatTimeOrder)
                    }
                }
                
                self.chatHeader.productImageView.kfSetImage(url: self.chat[0].data.sale.saleImgURL)
                self.chatHeader.statusLabel.text = String(self.chat[0].data.sale.status)
                self.chatHeader.productLabel.text = String(self.chat[0].data.sale.title)
                self.chatHeader.priceLabel.text = String(self.chat[0].data.sale.price.priceText)
                self.chatHeader.proposalLabel.text = self.chat[0].data.sale.isSuggest ? "" : "(가격제안불가)"
                self.headerViewTitle.text = String(self.chat[0].data.seller.nickname)
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
        return userIdOrder.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch userIdOrder[indexPath.row] {
        case 0:
            guard let guideCell = tableView.dequeueReusableCell(withIdentifier: ChatGuideTableViewCell.identifier, for: indexPath) as? ChatGuideTableViewCell else { return UITableViewCell() }
            guideCell.guideView.guideLabel1.text = String(self.chat[0].data.seller.nickname) + "님과 거래 예약을 했어요. 당근페이에 가"
            guideCell.selectionStyle = .none
            return guideCell
        case 1:
            guard let sendCell = tableView.dequeueReusableCell(withIdentifier: ChatSendTableViewCell.identifier, for: indexPath) as? ChatSendTableViewCell else { return UITableViewCell() }
            sendCell.sendView.receiveLabel.text = self.chatContentOrder[indexPath.row]
            sendCell.sendView.timeLabel.text = self.chatTimeOrder[indexPath.row].toTime
            sendCell.selectionStyle = .none
            return sendCell
        default:
            guard let receiveCell = tableView.dequeueReusableCell(withIdentifier: ChatReceiveTableViewCell.identifier, for: indexPath) as? ChatReceiveTableViewCell else { return UITableViewCell() }
            receiveCell.receiveView.receiveLabel.text = self.chatContentOrder[indexPath.row]
            receiveCell.receiveView.timeLabel.text = self.chatTimeOrder[indexPath.row].toTime
            receiveCell.selectionStyle = .none
            return receiveCell
        }

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch userIdOrder[indexPath.row] {
        case 0:
            return 90
        case 1:
            return 50
        default:
            return 50
        }
    }
}
