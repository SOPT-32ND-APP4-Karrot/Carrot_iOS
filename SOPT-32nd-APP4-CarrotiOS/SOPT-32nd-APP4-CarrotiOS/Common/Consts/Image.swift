//
//  Image.swift
//  SOPT-32nd-APP4-CarrotiOS
//
//  Created by kyun on 2023/05/15.
//

import UIKit

public enum Image {
    
    // MARK: - Tab Bar
    
    public static let hoverHomeIcon = UIImage(named: "hoverHome")
    public static let hoverMenuIcon = UIImage(named: "hoverMenu")
    public static let hoverMapIcon = UIImage(named: "hoverMap")
    public static let hoverChatIcon = UIImage(named: "hoverChat")
    public static let hoverMyIcon = UIImage(named: "hoverMy")
    
    public static let defaultHomeIcon = UIImage(named: "defaultHome")
    public static let defaultMenuIcon = UIImage(named: "defaultMenu")
    public static let defaultMapIcon = UIImage(named: "defaultMap")
    public static let defaultChatIcon = UIImage(named: "defaultChat")
    public static let defaultMyIcon = UIImage(named: "defaultMy")
    
    // MARK: - Heart
    
    public static let emptyHeartIcon = UIImage(named: "emptyHeart")
    public static let filledHeartIcon = UIImage(named: "filledHeart")
    
    // MARK: - Home
    
    public static let homeListIcon = UIImage(named: "home_ic_list")
    public static let homeSearchIcon = UIImage(named: "home_ic_search")
    public static let homeMenuIcon = UIImage(named: "home_ic_menu")
    public static let homeBellIcon = UIImage(named: "home_ic_bell")
    public static let homeDownIcon = UIImage(named: "home_ic_down")
    
    // MARK: - Sale
    
    public static let saleBackIcon = UIImage(named: "sale_ic_back")
    public static let saleShareIcon = UIImage(named: "sale_ic_share")
    public static let saleTopListIcon = UIImage(named: "sale_ic_top_list")
    public static let saleMiddleListIcon = UIImage(named: "sale_ic_middle_list")
    public static let saleUploadIcon = UIImage(named: "sale_ic_upload")
    public static let saleProfileIcon = UIImage(named: "sale_ic_profile")
    public static let saleNewProductIcon = UIImage(named: "sale_ic_new_product")
    public static let saleReportIcon = UIImage(named: "sale_ic_report")
    public static let saleSaleProductIcon = UIImage(named: "sale_ic_sale_product")
    public static let saleDiaryImage = UIImage(named: "sale_ic_diary")
    
    // MARK: - Chat
    
    public static let chatArrowLeftIcon = UIImage(named: "chat_ic_arrowleft")
    public static let chatPhoneIcon = UIImage(named: "chat_ic_phone")
    public static let chatMoreIcon = UIImage(named: "chat_ic_more")
    public static let chatPenIcon = UIImage(named: "chat_ic_pen")
    public static let chatProfileIcon = UIImage(named: "chat_ic_profile")
    public static let chatAddIcon = UIImage(named: "chat_ic_add")
    public static let chatEmojiIcon = UIImage(named: "chat_ic_emoji")
    public static let chatSendIcon = UIImage(named: "chat_ic_send")
    public static let chatSendIconOrange = UIImage(named: "chat_ic_send_orange")
    
    // MARK: - temparature
    
    public static let temparatureIcon1 = UIImage(named: "temparature1") // 0 < x < 16
    public static let temparatureIcon2 = UIImage(named: "temparature2") // 16 <= x < 26
    public static let temparatureIcon3 = UIImage(named: "temparature3") // 26 <= x < 37.6
    public static let temparatureIcon4 = UIImage(named: "temparature4") // 37.6 <= x < 46
    public static let temparatureIcon5 = UIImage(named: "temparature5") // 46 <= x < 56
    public static let temparatureIcon6 = UIImage(named: "temparature6") // 56 <= x < 100
}
