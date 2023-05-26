//
//  String+.swift
//  SOPT-32nd-APP4-CarrotiOS
//
//  Created by 정채은 on 2023/05/26.
//

import Foundation

extension String {
    
    var toTime: String {
        get {
            let dateFormatterGet = DateFormatter()
            dateFormatterGet.dateFormat = "yyyy. M. dd. a h:mm:ss"

            let dateFormatterPrint = DateFormatter()
            dateFormatterPrint.dateFormat = "a hh:mm"
            dateFormatterPrint.locale = Locale(identifier: "ko")

            if let date = dateFormatterGet.date(from: self) {
                return dateFormatterPrint.string(from: date as Date)
            } else {
               return self
            }
        }
    }
}
