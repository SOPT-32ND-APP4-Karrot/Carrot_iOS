//
//  SaleHeaderView.swift
//  SOPT-32nd-APP4-CarrotiOS
//
//  Created by 박윤빈 on 2023/05/17.
//

import UIKit

import SnapKit
import Then

class SaleHeaderView: UITableViewHeaderFooterView {
    
    // MARK: - Components
    private let headerImageView = UIImageView().then {
        $0.image = Image.saleDiaryImage
        $0.contentMode = .scaleAspectFill
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.setLayout()
    }

    internal func setResizeView(_ yValue: CGFloat) {
            self.headerImageView.snp.remakeConstraints {
                $0.edges.equalToSuperview().inset(yValue)
            }
        }
    
    private func setLayout() {
        self.addSubview(headerImageView)
        headerImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
