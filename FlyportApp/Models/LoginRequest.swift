//
//  LoginRequest.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-03.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation

public struct LoginRequest: Codable {
	public let login: String
	public let password: String
	
	public init(login: String, password: String) {
		self.login = login
		self.password = password
	}
}
