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
    private var optionTabController: UINavigationController!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    private func setupUI() {
        feedTabController = UINavigationController(rootViewController: FeedController())
        profileTabController = UINavigationController.init(rootViewController: ProfileController())
        optionTabController = UINavigationController.init(rootViewController: OptionController())

        self.viewControllers = [feedTabController, profileTabController, optionTabController]

        let feedItem = UITabBarItem(title: "FEED",
                                    image: UIImage(systemName: "newspaper"), tag: 0)

        let profileItem = UITabBarItem(title: "Profile",
                                       image:  UIImage(systemName: "brain.head.profile"), tag: 1)
        let optionItem = UITabBarItem(title: "Option", image: UIImage(systemName: "helm"), tag: 2)

        feedTabController.tabBarItem = feedItem
        profileTabController.tabBarItem = profileItem
        optionTabController.tabBarItem = optionItem

        UITabBar.appearance().tintColor = .black
        UITabBar.appearance().backgroundColor = .yellow
        UITabBar.appearance().unselectedItemTintColor = .gray

    }
}
