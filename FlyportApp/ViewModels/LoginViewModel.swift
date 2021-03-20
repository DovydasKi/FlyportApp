//
//  LoginViewModel.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-02.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation
import UIKit

class LoginViewModel {
	private static var appTitle = LocalizationKeys.flyPortTitle.localized()
	private static var email = LocalizationKeys.email.localized()
	private static var password = LocalizationKeys.password.localized()
	private static var registerTitle = LocalizationKeys.registerTitle.localized()
	private static let unsuccessfulLogin = LocalizationKeys.unsuccessfulLoginTitle.localized()
	private static let unsuccessfulLoginMessage = LocalizationKeys.unsuccessfulLoginMessage.localized()
	private static let tryAgain = LocalizationKeys.tryAgain.localized()
	private var inputValidation = InputValidation()
	private var loginService: LoginService
	
	public init(service: LoginService = LoginService()) {
		self.loginService = service
	}
	
	public func checkForAllValidFields(emailField: UITextField, passwordField: UITextField) -> Bool {
		var emailIsValid = false
		var passwordIsValid = false
		if !self.inputValidation.checkForValidEmailRegularExpression(input: emailField) {
			emailField.text = ""
			self.inputValidation.shakeIfInvalid(textField: emailField)
		} else { emailIsValid = true }
		if !self.inputValidation.checkForValidStringLenght(input: passwordField, lenght: 4) {
			passwordField.text = ""
			self.inputValidation.shakeIfInvalid(textField: passwordField)
		} else { passwordIsValid = true }
		if emailIsValid && passwordIsValid {
			return true
		}
		return false
	}
	
	public func loginToService(emailText: String?, passwordText: String?, completion: @escaping (Bool) -> ()) {
		let domain = Bundle.main.bundleIdentifier!
		UserDefaults.standard.removePersistentDomain(forName: domain)
		UserDefaults.standard.synchronize()
		if let email = emailText, let password = passwordText {
			let loginRequest = LoginRequest(login: email, password: password)
			let data = try! JSONEncoder().encode(loginRequest)
			
			self.loginService.login(data: data) {
				result in
				if let id = result?.userId {
					UserDefaults.standard.setUserId(value: id)
					completion(true)
				} else {
					completion(false)
				}
			}
		} else {
			completion(false)
		}
	}
	
	public func getUserProfileData(completion: @escaping (Bool) -> ()) {
		self.loginService.getProfileData() {
			result in
			if let userProfile = result {
				UserDefaults.standard.setLoginInfo(value: userProfile.userLoginInfoModel)
				UserDefaults.standard.setPersonalInfo(value: userProfile.userPersonalInfoModel)
				completion(true)
			} else {
				completion(false)
			}
		}
	}
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
	
	public var unsuccessfulLogin: String {
		return type(of: self).unsuccessfulLogin
	}
	
	public var unsuccessfulLoginMessage: String {
		return type(of: self).unsuccessfulLoginMessage
	}
	
	public var tryAgain: String {
		return type(of: self).tryAgain
	}
}
