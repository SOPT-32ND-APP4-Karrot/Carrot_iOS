//
//  UIFont+.swift
//  SOPT-32nd-APP4-CarrotiOS
//
//  Created by kyun on 2023/05/15.
//

import UIKit

// ex)
// $0.titleLabel?.font = .appleGothicBold(20)

extension UIFont {
    
    static func appleGothicBold(_ size: CGFloat) -> UIFont{
        return UIFont(name: "AppleSDGothicNeoB", size: size)!
    }
    
    static func appleGothicMedium(_ size: CGFloat) -> UIFont{
        return UIFont(name: "AppleSDGothicNeoM", size: size)!
    }
    
    static func appleGothicRegular(_ size: CGFloat) -> UIFont{
        return UIFont(name: "AppleSDGothicNeoR", size: size)!
    }
    
    static func pretendardBold(_ size: CGFloat) -> UIFont{
        return UIFont(name: "Pretendard-Bold", size: size)!
    }
}
