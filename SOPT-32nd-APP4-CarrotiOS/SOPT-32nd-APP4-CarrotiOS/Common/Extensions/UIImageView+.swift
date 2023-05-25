//
//  UIImageView+.swift
//  SOPT-32nd-APP4-CarrotiOS
//
//  Created by 정채은 on 2023/05/26.
//

import UIKit

import Kingfisher

extension UIImageView{
    func kfSetImage(url : String?){
        
        guard let url = url else {
            print(url)
            return }
        
        if let url = URL(string: url) {
            kf.indicatorType = .activity
            kf.setImage(with: url,
                        placeholder: nil,
                        options: [.transition(.fade(1.0))], progressBlock: nil)
        }
    }
}
