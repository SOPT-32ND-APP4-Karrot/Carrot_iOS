//
//  UIFont+.swift
//  SOPT-32nd-APP4-CarrotiOS
//
//  Created by kyun on 2023/05/15.
//

import UIKit

// ex)
// $0.titleLabel?.font = .appleGothicBold(19)
// $0.font = .body1

extension UIFont {
    
    static func appleGothicBold(_ size: CGFloat) -> UIFont {
        return UIFont(name: "AppleSDGothicNeo-Bold", size: size)!
    }
    
    static func appleGothicMedium(_ size: CGFloat) -> UIFont {
        return UIFont(name: "AppleSDGothicNeo-Medium", size: size)!
    }
    
    static func appleGothicRegular(_ size: CGFloat) -> UIFont {
        return UIFont(name: "AppleSDGothicNeo-Regular", size: size)!
    }
    
    static func pretendardBold(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Pretendard-Bold", size: size)!
    }
    
    
    class var title: UIFont {
        return UIFont(name: "AppleSDGothicNeo-Bold", size: 20.0)!
    }
    
    class var body1: UIFont {
        return UIFont(name: "AppleSDGothicNeo-Bold", size: 16.0)!
    }
    
    class var body2: UIFont {
        return UIFont(name: "AppleSDGothicNeo-Regular", size: 16.0)!
    }
    
    class var body3: UIFont {
        return UIFont(name: "AppleSDGothicNeo-Bold", size: 14.0)!
    }
    
    class var body4: UIFont {
        return UIFont(name: "AppleSDGothicNeo-Medium", size: 14.0)!
    }
    
    class var body5: UIFont {
        return UIFont(name: "AppleSDGothicNeo-Regular", size: 14.0)!
    }
    
    class var body6: UIFont {
        return UIFont(name: "AppleSDGothicNeo-Bold", size: 12.0)!
    }
    
    class var detail1: UIFont {
        return UIFont(name: "AppleSDGothicNeo-Medium", size: 10.0)!
    }
    
    class var detail2: UIFont {
        return UIFont(name: "AppleSDGothicNeo-Regular", size: 10.0)!
    }
    
    class var number1: UIFont {
        return UIFont(name: "Pretendard-Bold", size: 16.0)!
    }
    
    class var number2: UIFont {
        return UIFont(name: "Pretendard-Bold", size: 14.0)!
    }
    
    class var number3: UIFont {
        return UIFont(name: "Pretendard-Bold", size: 12.0)!
    }
    

}
