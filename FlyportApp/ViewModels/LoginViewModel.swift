//
//  LoginViewModel.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-02.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation

class LoginViewModel {
	private static var appTitle = "FlyPort"
	private static var email = "Email"
	private static var password = "Password"
	private static var registerTitle = "Are you new here? Register here"
}

extension LoginViewModel {
	public var appTitle: String {
		return type(of: self).appTitle
	}
	
	public var email: String {
		return type(of: self).email
	}
	
	public var password: String {
		return type(of: self).password
	}
	
	public var registerTitle: String {
		return type(of: self).registerTitle
	}
}
