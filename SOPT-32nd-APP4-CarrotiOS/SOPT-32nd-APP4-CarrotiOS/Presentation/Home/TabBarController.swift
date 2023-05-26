//
//  TabBarController.swift
//  SOPT-32nd-APP4-CarrotiOS
//
//  Created by kyun on 2023/05/26.
//

import UIKit

class TabBarController: UITabBarController {
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setTabBar()
    }
}

extension TabBarController {
    
    private func makeTabBar(viewController: UIViewController,
                            title: String,
                            tabBarImg: UIImage,
                            tabBarSelectedImg: UIImage,
                            renderingMode: UIImage.RenderingMode) -> UIViewController {
        
        let tab = UINavigationController(rootViewController: viewController)
        tab.isNavigationBarHidden = true
        tab.tabBarItem = UITabBarItem(title: title,
                                      image: tabBarImg.withRenderingMode(renderingMode),
                                      selectedImage: tabBarSelectedImg.withRenderingMode(renderingMode))
        
        return tab
    }
    
    private func setTabBar() {
        
        let home = makeTabBar(viewController: HomeViewController(),
                              title: "홈",
                              tabBarImg: Image.hoverHomeIcon,
                              tabBarSelectedImg: Image.hoverHomeIcon,
                              renderingMode: .alwaysTemplate)
        let menu = makeTabBar(viewController: HomeViewController(),
                              title: "동네생활",
                              tabBarImg: Image.defaultMenuIcon,
                              tabBarSelectedImg: Image.defaultMenuIcon,
                              renderingMode: .alwaysTemplate)
        let map = makeTabBar(viewController: HomeViewController(),
                             title: "내 근처",
                             tabBarImg: Image.defaultMapIcon,
                             tabBarSelectedImg: Image.defaultMapIcon,
                             renderingMode: .alwaysTemplate)
        let chat = makeTabBar(viewController: HomeViewController(),
                              title: "채팅",
                              tabBarImg: Image.defaultChatIcon,
                              tabBarSelectedImg: Image.defaultChatIcon,
                              renderingMode: .alwaysTemplate)
        let my = makeTabBar(viewController: HomeViewController(),
                            title: "나의 당근",
                            tabBarImg: Image.defaultMyIcon,
                            tabBarSelectedImg: Image.defaultMyIcon,
                            renderingMode: .alwaysTemplate)
        
        let tabs = [home, menu, map, chat, my]
        
        self.setViewControllers(tabs, animated: false)
        
        tabBar.backgroundColor = .white
        tabBar.tintColor = Color.carrotBlack
        tabBar.unselectedItemTintColor = Color.carrotGray3
    }
}
