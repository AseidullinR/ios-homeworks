//
//  TabBarController.swift
//  Navigation
//
//  Created by RAMIL ASEYDULLIN on 20.11.2022.
//

import UIKit

final class TabBarController: UITabBarController {
    private var feedTabController: UINavigationController!
    private var profileTabController: UINavigationController!


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        setupUI()
    }
    private func setupUI() {
        feedTabController = UINavigationController(rootViewController: FeedViewController())
        profileTabController = UINavigationController.init(rootViewController: ProfileViewController())



        self.viewControllers = [feedTabController, profileTabController]

        let feedItem = UITabBarItem(title: "FEED",
                                    image: UIImage(systemName: "house.fill"), tag: 0)

        let profileItem = UITabBarItem(title: "Profile",
                                       image:  UIImage(systemName: "person.fill"), tag: 1)


        feedTabController.tabBarItem = feedItem
        profileTabController.tabBarItem = profileItem


        UITabBar.appearance().tintColor = .black
        UITabBar.appearance().backgroundColor = .white
        UITabBar.appearance().tintColor = UIColor(white: 0, alpha: 0.5)
        UITabBar.appearance().unselectedItemTintColor = .gray

    }
}
