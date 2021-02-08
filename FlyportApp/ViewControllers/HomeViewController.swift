//
//  HomeViewController.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-08.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation
import UIKit

class HomeScreenViewController: UIViewController {
	var tabBar = TabBarViewController()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		navigationController?.navigationBar.isHidden = true
		self.view.addSubview(self.tabBar.view)
	}
}
