//
//  UILabel+.swift
//  SOPT-32nd-APP4-CarrotiOS
//
//  Created by 정채은 on 2023/05/16.
//


import UIKit

extension UILabel {
    func setTextWithLineHeight(text: String?, lineHeight: CGFloat) {
        if let text = text {
            let style = NSMutableParagraphStyle()
            style.maximumLineHeight = lineHeight
            style.minimumLineHeight = lineHeight
            
            let attributes: [NSAttributedString.Key: Any] = [
                .paragraphStyle: style,
                .baselineOffset: (lineHeight - font.lineHeight) / 4
            ]
            
            let attrString = NSAttributedString(string: text,
                                                attributes: attributes)
            self.attributedText = attrString
            self.textAlignment = .center
        }
    }
}
