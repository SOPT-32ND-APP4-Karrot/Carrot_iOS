//
//  ChatGuideTableViewCell.swift
//  SOPT-32nd-APP4-CarrotiOS
//
//  Created by 정채은 on 2023/05/19.
//

import UIKit

import SnapKit
import Then

final class ChatGuideTableViewCell: UITableViewCell {
    
    static let identifier = "ChatGuideTableViewCell"
    
    let guideView = GuideView()
    
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
        self.addSubview(guideView)
        guideView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}
