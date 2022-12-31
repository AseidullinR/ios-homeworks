//
//  TabBarController.swift
//  Navigation
//
//  Created by RAMIL ASEYDULLIN on 20.11.2022.
//

import UIKit

final class TabBarController: UITabBarController {
    private var profileTabController: UINavigationController!
    private var feedTabController: UINavigationController!


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        setupUI()
    }
    private func setupUI() {
        profileTabController = UINavigationController.init(rootViewController: LogInViewController())
        feedTabController = UINavigationController(rootViewController: FeedViewController())

        self.viewControllers = [feedTabController, profileTabController]


        let profileItem = UITabBarItem(title: "Profile",
                                       image:  UIImage(systemName: "person.fill"), tag: 1)

        let feedItem = UITabBarItem(title: "FEED",
                                    image: UIImage(systemName: "house.fill"), tag: 0)


        profileTabController.tabBarItem = profileItem
        feedTabController.tabBarItem = feedItem



        UITabBar.appearance().tintColor = .black
        UITabBar.appearance().backgroundColor = .systemGray6
        UITabBar.appearance().tintColor = UIColor(white: 0, alpha: 0.5)
        UITabBar.appearance().tintColor = colorSet

    }
}
