//
//  TabBarViewController.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-08.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation
import UIKit

class TabBarViewController: UITabBarController {
	enum TabView: Int {
		case myProfile, myFlights, settings
	}
	
	private var contentViewControllers: [UIViewController] = []
    private var tabBarViewModel = TabBarViewModel()
	
	private lazy var profileViewController: UIViewController = {
        let viewController = ProfileViewController()
        
        let title = self.tabBarViewModel.profileTitle
		viewController.title = title
		
		viewController.tabBarItem = UITabBarItem(
			title: title,
			image: #imageLiteral(resourceName: "userTabBar"),
			tag: TabView.myProfile.rawValue)
		
		viewController.tabBarItem.selectedImage = #imageLiteral(resourceName: "userTabBar")
        
		let navigationController = UINavigationController(rootViewController: viewController)
		return navigationController
	}()
	
	private lazy var myFlightsViewController: UIViewController = {
		let viewController = MyFlightsViewController()
		let title = self.tabBarViewModel.myFlightsTitle
		viewController.title = title
		
		viewController.tabBarItem = UITabBarItem(
			title: title,
			image: #imageLiteral(resourceName: "myFlights"),
			tag: TabView.myFlights.rawValue)
		
		viewController.tabBarItem.selectedImage = #imageLiteral(resourceName: "myFlights")
		let navigationController = UINavigationController(rootViewController: viewController)
		return navigationController
	}()
	
	private lazy var settingsViewController: UIViewController = {
		let viewController = SettingsViewController()
		let title = self.tabBarViewModel.settingsTitle
		viewController.title = title
		
		viewController.tabBarItem = UITabBarItem(
			title: title,
			image: #imageLiteral(resourceName: "settings"),
			tag: TabView.settings.rawValue)
		
		viewController.tabBarItem.selectedImage = #imageLiteral(resourceName: "settings")
		let navigationController = UINavigationController(rootViewController: viewController)
		return navigationController
	}()
	
	override public func viewDidLoad() {
		super.viewDidLoad()
		
		self.view.backgroundColor = .white
		self.contentViewControllers = [self.profileViewController, self.myFlightsViewController, self.settingsViewController]
		self.viewControllers = self.contentViewControllers
		navigationController?.navigationBar.isHidden = true
		self.selectedIndex = 1
	}
}
