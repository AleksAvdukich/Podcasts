//
//  MainTabBarController.swift
//  Podcasts
//
//  Created by Aleksandr Avdukich on 30.06.2020.
//  Copyright © 2020 Aleksandr Avdukich. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UINavigationBar.appearance().prefersLargeTitles = true
        
        tabBar.tintColor = .purple
        
        setupViewControllers()
    }
    
    // MARK: - Setup Functions Here
    
    func setupViewControllers() {
        viewControllers = [
            generateNavigationController(with: ViewController(), title: "Favorites", image: UIImage.init(named: "favorites") ?? nil),
            generateNavigationController(with: ViewController(), title: "Search", image: UIImage.init(named: "search") ?? nil),
            generateNavigationController(with: ViewController(), title: "Downloads", image: UIImage.init(named: "downloads") ?? nil)
        ]
    }
    
    // MARK: - Helper Functions
    
    fileprivate func generateNavigationController(with rootViewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        //        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        return navController
    }
    
}
