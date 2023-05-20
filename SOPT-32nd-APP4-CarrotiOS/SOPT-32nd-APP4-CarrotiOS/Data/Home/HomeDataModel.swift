//
//  HomeDataModel.swift
//  SOPT-32nd-APP4-CarrotiOS
//
//  Created by kyun on 2023/05/20.
//

import Foundation

// MARK: - Home
struct Home: Codable {
    let status: Int
    let message: String
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Codable {
    let saleID: Int
    let title: String
    let saleImgURL: String
    let location, time: String
    let isUpdated: Bool
    let price: Int
    let isDiscount: Bool
    let likeCount: Int
    let isCheckLike: Bool

    enum CodingKeys: String, CodingKey {
        case saleID = "saleId"
        case title
        case saleImgURL = "saleImgUrl"
        case location, time, isUpdated, price, isDiscount, likeCount, isCheckLike
    }
}
