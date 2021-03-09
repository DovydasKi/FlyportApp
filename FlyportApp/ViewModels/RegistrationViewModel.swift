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
	private static let name: String = "Name"
	private static let surname: String = "Surname"
	private static let personalCode: String = "Personal code"
	private static let documentNumber: String = "Document number"
	private static let successfulRegistration: String = "Registration successful"
	private static let successfulRegistrationSubtitle: String = "Now you can login"
	private static let login: String = "Login"
	private static let unsuccessfulRegistration = "Unsuccessfull registration"
	private static let unsuccessfulRegistrationMessage = "Something went wrong. Try again"
	private static let tryAgain = "Try again"
    private var inputValidation = InputValidation()
	private let loginService = LoginService()
	
    public func checkForAllValidFields(emailField: UITextField, passwordField: UITextField, repeatPasswordField: UITextField) -> Bool {
        var emailIsValid = false
        var passwordIsValid = false
		var repeatPasswordIsValid = false

        if !self.inputValidation.checkForValidEmailRegularExpression(input: emailField) {
            self.inputValidation.shakeIfInvalid(textField: emailField)
        }
        else { emailIsValid = true }
        if !self.inputValidation.checkForValidStringLenght(input: passwordField, lenght: 5) {
            self.inputValidation.shakeIfInvalid(textField: passwordField)
        }
        else { passwordIsValid = true }
		if passwordField.text != repeatPasswordField.text {
			self.inputValidation.shakeIfInvalid(textField: repeatPasswordField)
		}
		else { repeatPasswordIsValid = true }
        if emailIsValid && passwordIsValid && repeatPasswordIsValid{
            return true
        }
        return false
    }
	
	public func checkPersonalDataValidFields(name: UITextField, surname: UITextField, personalCode: UITextField, documentNumber: UITextField) -> Bool {
        var nameIsValid = false
        var surnameIsValid = false
		var personalCodeIsValid = false
		var documentNumberIsValid = false

        if !self.inputValidation.checkForValidStringLenght(input: name, lenght: 2) {
            self.inputValidation.shakeIfInvalid(textField: name)
        }
        else { nameIsValid = true }
        if !self.inputValidation.checkForValidStringLenght(input: surname, lenght: 5) {
            self.inputValidation.shakeIfInvalid(textField: surname)
        }
        else { surnameIsValid = true }
        if !self.inputValidation.checkForValidStringLenght(input: personalCode, lenght: 11) {
            self.inputValidation.shakeIfInvalid(textField: personalCode)
        }
        else { personalCodeIsValid = true }
        if !self.inputValidation.checkForValidStringLenght(input: documentNumber, lenght: 15) {
            self.inputValidation.shakeIfInvalid(textField: documentNumber)
        }
        else { documentNumberIsValid = true }
        if nameIsValid && surnameIsValid && personalCodeIsValid && documentNumberIsValid{
            return true
        }
        return false
    }
	
	public func registerToService(emailText: String?, passwordText: String?, nameText: String?, surnameText: String?, personalCodeText: String?, documentNumberText: String?, completion: @escaping (Bool) -> ()) {
		if let email = emailText, let password = passwordText, let name = nameText, let surname = surnameText, let personalCode = personalCodeText, let documentNumber = documentNumberText {
			let registrationRequest = RegistrationRequestModel(email: email, password: password, name: name, surname: surname, personalCode: personalCode, documentNumber: documentNumber)
			let data = try! JSONEncoder().encode(registrationRequest)
			
			self.loginService.register(data: data) {
				result in
				if result {
					completion(true)
				} else {
					completion(false)
				}
			}
		} else {
			completion(false)
		}
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
	
	public var name: String {
		return type(of: self).name
	}
	
	public var surname: String {
		return type(of: self).surname
	}
	
	public var personalCode: String {
		return type(of: self).personalCode
	}
	
	public var documentNumber: String {
		return type(of: self).documentNumber
	}
	
	public var successfulRegistration: String {
		return type(of: self).successfulRegistration
	}
	
	public var successfulRegistrationSubtitle: String {
		return type(of: self).successfulRegistrationSubtitle
	}
	
	public var login: String {
		return type(of: self).login
	}
	
	public var unsuccessfulRegistration: String {
		return type(of: self).unsuccessfulRegistration
	}
	
	public var unsuccessfulRegistrationMessage: String {
		return type(of: self).unsuccessfulRegistrationMessage
	}
	
	public var tryAgain: String {
		return type(of: self).tryAgain
	}
}
