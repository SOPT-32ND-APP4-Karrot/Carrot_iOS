//
//  UIStackView+.swift
//  SOPT-32nd-APP4-CarrotiOS
//
//  Created by kyun on 2023/05/19.
//

import UIKit

extension UIStackView {
    
    func addArrangedSubviews(_ views: UIView...) {
         
         for view in views {
             self.addArrangedSubview(view)
         }
     }
    
}
