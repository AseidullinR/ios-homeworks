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
        feedTabController = UINavigationController(rootViewController: FeedController())
        profileTabController = UINavigationController.init(rootViewController: ProfileController())

        self.viewControllers = [feedTabController, profileTabController]

        let feedItem = UITabBarItem(title: "FEED",
                                    image: UIImage(systemName: "house.fill"), tag: 0)

        let profileItem = UITabBarItem(title: "Profile",
                                       image:  UIImage(systemName: "person.fill"), tag: 1)


        feedTabController.tabBarItem = feedItem
        profileTabController.tabBarItem = profileItem


        UITabBar.appearance().tintColor = .black
        UITabBar.appearance().backgroundColor = .white
        UITabBar.appearance().unselectedItemTintColor = .gray

    }
}
