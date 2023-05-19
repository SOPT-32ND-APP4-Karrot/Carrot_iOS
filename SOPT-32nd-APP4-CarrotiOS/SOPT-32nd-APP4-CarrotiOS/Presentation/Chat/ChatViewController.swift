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
    
    var dummy: [Int] = [1, 2, 1, 0, 2, 1, 2, 1, 1]
    
    //MARK: Components
    let headerView = HeaderView()
    
    let chatHeader = ChatHeader()
    
    private lazy var tableView = UITableView(frame: .zero, style: .plain).then {
        $0.register(ChatGuideTableViewCell.self, forCellReuseIdentifier: ChatGuideTableViewCell.identifier)
        $0.register(ChatReceiveTableViewCell.self, forCellReuseIdentifier: ChatReceiveTableViewCell.identifier)
        $0.register(ChatSendTableViewCell.self, forCellReuseIdentifier: ChatSendTableViewCell.identifier)
        $0.delegate = self
        $0.dataSource = self
        $0.backgroundColor = .clear
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
            tableView,
            chatHeader,
            headerView
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
        
        tableView.snp.makeConstraints{
            $0.top.equalTo(chatHeader.snp.bottom)
            $0.width.equalToSuperview()
            $0.height.equalToSuperview().inset(91)
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
            return guideCell
        case 1:
            guard let receiveCell = tableView.dequeueReusableCell(withIdentifier: ChatReceiveTableViewCell.identifier, for: indexPath) as? ChatReceiveTableViewCell else { return UITableViewCell() }
            return receiveCell
        case 2:
            guard let sendCell = tableView.dequeueReusableCell(withIdentifier: ChatSendTableViewCell.identifier, for: indexPath) as? ChatSendTableViewCell else { return UITableViewCell() }
            
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
