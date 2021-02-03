//
//  RegistrationViewModel.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-03.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation

class RegistrationViewModel {
	private static let title: String = "FlyPort"
	private static let username: String = "Username"
	private static let email: String = "Email"
	private static let password: String = "Password"
	private static let repeatPassword: String = "Repeat password"
	private static let loginHereTitle: String = "Do you already have an account?\nLogin here"
}

extension RegistrationViewModel {
	public var title: String {
		return type(of: self).title
	}
	
	public var username: String {
		return type(of: self).username
	}
	
	public var email: String {
		return type(of: self).email
	}
	
	public var password: String {
		return type(of: self).password
	}
	
	public var repeatPassword: String {
		return type(of: self).repeatPassword
	}
	
	public var loginHereTitle: String {
		return type(of: self).loginHereTitle
	}
}
