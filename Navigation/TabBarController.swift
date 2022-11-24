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
        setupUI()
    }
    private func setupUI() {
        feedTabController = UINavigationController(rootViewController: FeedController())
        profileTabController = UINavigationController.init(rootViewController: ProfileController())

        self.viewControllers = [feedTabController, profileTabController]

        let feedItem = UITabBarItem(title: "FEED",
                                    image: UIImage(systemName: "newspaper"), tag: 0)

        let profileItem = UITabBarItem(title: "Profile",
                                       image:  UIImage(systemName: "brain.head.profile"), tag: 1)

        feedTabController.tabBarItem = feedItem
        profileTabController.tabBarItem = profileItem

        UITabBar.appearance().tintColor = .black
        UITabBar.appearance().backgroundColor = .yellow
    }
}
