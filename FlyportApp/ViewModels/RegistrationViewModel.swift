//
//  RegistrationViewModel.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-03.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation
import UIKit

class RegistrationViewModel {
	private static let title: String = "FlyPort"
	private static let username: String = "Username"
	private static let email: String = "Email"
	private static let password: String = "Password"
	private static let repeatPassword: String = "Repeat password"
	private static let loginHereTitle: String = "Do you already have an account?\nLogin here"
    private var inputValidation = InputValidation()
	
    public func checkForAllValidFields(userNameField: UITextField, emailField: UITextField, passwordField: UITextField, repeatPasswordField: UITextField) -> Bool {
        var userNameIsValid = false
        var emailIsValid = false
        var passwordIsValid = false
		var repeatPasswordIsValid = false

        if !self.inputValidation.checkForValidStringLenght(input: userNameField, lenght: 5) || !self.inputValidation.checkForValidStringRegularExpression(input: userNameField, regularExpression: ".*[^A-Za-z0-9].*") {
            self.inputValidation.shakeIfInvalid(textField: userNameField)
        }
        else { userNameIsValid = true }
        if !self.inputValidation.checkForValidEmailRegularExpression(input: emailField) {
            self.inputValidation.shakeIfInvalid(textField: emailField)
        }
        else { emailIsValid = true }
        if !self.inputValidation.checkForValidStringLenght(input: passwordField, lenght: 5) {
            passwordField.text = ""
            self.inputValidation.shakeIfInvalid(textField: passwordField)
        }
        else { passwordIsValid = true }
		if passwordField.text != repeatPasswordField.text {
			repeatPasswordField.text = ""
			self.inputValidation.shakeIfInvalid(textField: repeatPasswordField)
		}
		else { repeatPasswordIsValid = true }
        if userNameIsValid && emailIsValid && passwordIsValid && repeatPasswordIsValid{
            return true
        }
        return false
    }
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
