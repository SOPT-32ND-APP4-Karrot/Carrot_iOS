//
//  ChatReceiveTableViewCell.swift
//  SOPT-32nd-APP4-CarrotiOS
//
//  Created by 정채은 on 2023/05/19.
//

import UIKit

import SnapKit
import Then

final class ChatReceiveTableViewCell: UITableViewCell {
    
    static let identifier = "ChatReceiveTableViewCell"
    
    let receiveView = ReceiveView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setStyle()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setStyle() {
        
    }
    
    private func setLayout() {
        self.addSubview(receiveView)
        receiveView.snp.makeConstraints{
            $0.top.bottom.height.equalToSuperview()
            $0.leading.equalToSuperview().offset(15)
        }
    }
}
