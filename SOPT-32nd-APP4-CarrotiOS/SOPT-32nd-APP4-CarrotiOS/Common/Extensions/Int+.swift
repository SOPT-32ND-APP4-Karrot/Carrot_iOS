//
//  Int+.swift
//  SOPT-32nd-APP4-CarrotiOS
//
//  Created by kyun on 2023/05/15.
//

// ex)
// priceLabel.text = carrot.price.priceText

import Foundation

extension Int {
    
    var priceText: String {
        get {
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            
            var priceString = numberFormatter.string(for: self) ?? "-1"
            priceString = priceString + "원"
            return priceString
        }
    }
}
