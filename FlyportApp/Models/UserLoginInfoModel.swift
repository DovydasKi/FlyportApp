//
//  UserLoginInfoModel.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-09.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation

public struct UserLoginInfoModel: Decodable {
	public var email: String
	public var password: String
	
	public init (email: String, password: String) {
		self.email = email
		self.password = password
	}
}
