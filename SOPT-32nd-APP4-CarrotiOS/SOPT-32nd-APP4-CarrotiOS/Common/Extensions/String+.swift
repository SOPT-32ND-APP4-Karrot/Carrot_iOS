//
//  String+.swift
//  SOPT-32nd-APP4-CarrotiOS
//
//  Created by 정채은 on 2023/05/26.
//

import Foundation

extension String {
    
    func toTime(dateStr: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.M.dd a h:mm:ss" // 2020-08-13 16:30
        
        let convertDate = dateFormatter.date(from: dateStr) // Date 타입으로 변환
        
        let myDateFormatter = DateFormatter()
        myDateFormatter.dateFormat = "a hh시 mm분" // 2020년 08월 13일 오후 04시 30분
        myDateFormatter.locale = Locale(identifier:"ko_KR") // PM, AM을 언어에 맞게 setting (ex: PM -> 오후)
        let convertStr = myDateFormatter.string(from: convertDate!)
    }
}
