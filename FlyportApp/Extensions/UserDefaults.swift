//
//  UserDefaults.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-04.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//
import UIKit
import Foundation

extension UserDefaults {
	func getUserId() -> Int {
		return integer(forKey: UserDefaultKeys.userId.rawValue)
	}
	
	func setUserId(value: Int) {
		set(value, forKey: UserDefaultKeys.userId.rawValue)
	}
}
