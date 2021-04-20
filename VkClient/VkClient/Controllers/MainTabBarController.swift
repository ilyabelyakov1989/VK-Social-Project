//
//  MainTabBarController.swift
//  VkClient
//
//  Created by Ilya Belyakov on 17.04.2021.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let feedController = FeedController(collectionViewLayout: UICollectionViewFlowLayout())
        let navigationController = UINavigationController(rootViewController: feedController)
        feedController.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "book"), selectedImage: UIImage(systemName: "book"))
        feedController.navigationItem.title = "News Feed"
        self.viewControllers! += [navigationController]

    }
}
