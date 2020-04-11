//
//  AppTabBarViewController.swift
//  base-app
//
//  Created by Erick Kaique Da Silva on 20/03/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

import UIKit

class AppTabBarViewController: UITabBarController, UITabBarControllerDelegate, AppTabBarViewControllerType {
    
    var delegateTabBar: AppTabBarViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectedIndex = 0
        delegate = self
        self.tabBar.barTintColor = Colors.backgroundColorDefault
        self.tabBar.barStyle = .black
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let searchVC = SearchViewController()
        let iconHome = UITabBarItem(title: "", image: UIImage(named: "searchIcon.png"), selectedImage: UIImage(named: "searchIcon.png"))
        searchVC.tabBarItem = iconHome
        searchVC.delegate = self
        let listVC = ListViewController()
        let iconList = UITabBarItem(title: "", image: UIImage(named: "listIcon.png"), selectedImage: UIImage(named: "listIcon.png"))
        listVC.tabBarItem = iconList
        listVC.delegate = self
        let controllers = [searchVC, listVC]  //array of the root view controllers displayed by the tab bar interface
        self.viewControllers = controllers
    }
}

// MARK: - ListViewControllerDelegate
extension AppTabBarViewController: ListViewControllerDelegate {
    func wantsToContinueDetailUser(user: AllUsers) {
//        self.delegateTabBar?.wantsToDetailUser(user: user)
    }
}
// MARK: - SearchViewControllerDelegate
extension AppTabBarViewController: SearchViewControllerDelegate {
    func wantsToUserDetail(_ user: User) {
        self.delegateTabBar?.wantsToDetailUser(user: user)
    }
}
