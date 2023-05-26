//
//  Chat.swift
//  SOPT-32nd-APP4-CarrotiOS
//
//  Created by 정채은 on 2023/05/25.
//

import Foundation

// MARK: - Chat
struct Chat: Codable {
    let status: Int
    let message: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let chatRoomID: Int
    let chatMessageList: [ChatMessageList]
    let sale: Sale
    let seller: Seller
    let reviewID: Int

    enum CodingKeys: String, CodingKey {
        case chatRoomID = "chatRoomId"
        case chatMessageList, sale, seller
        case reviewID = "reviewId"
    }
}

// MARK: - ChatMessageList
struct ChatMessageList: Codable {
    let chatMessageID: Int
    let content: String
    let hasKeyword: Bool
    let time: String
    let writer: Seller

    enum CodingKeys: String, CodingKey {
        case chatMessageID = "chatMessageId"
        case content, hasKeyword, time, writer
    }
}

// MARK: - Seller
struct Seller: Codable {
    let userID: Int
    let nickname, profileImgURL: String
    let phone: String?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case nickname
        case profileImgURL = "profileImgUrl"
        case phone
    }
}

// MARK: - Sale
struct Sale: Codable {
    let saleID: Int
    let title: String
    let saleImgURL: String
    let price: Int
    let isSuggest: Bool
    let status: String

    enum CodingKeys: String, CodingKey {
        case saleID = "saleId"
        case title
        case saleImgURL = "saleImgUrl"
        case price, isSuggest, status
    }
}
