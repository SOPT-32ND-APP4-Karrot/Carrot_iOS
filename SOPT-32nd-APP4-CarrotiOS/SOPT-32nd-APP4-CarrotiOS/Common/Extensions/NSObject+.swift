//
//  NSObject+.swift
//  SOPT-32nd-APP4-CarrotiOS
//
//  Created by kyun on 2023/05/25.
//

import Foundation

extension NSObject {
    
    static var className: String {
        NSStringFromClass(self.classForCoder()).components(separatedBy: ".").last!
    }
    
    var className: String {
        NSStringFromClass(self.classForCoder).components(separatedBy: ".").last!
    }
}
