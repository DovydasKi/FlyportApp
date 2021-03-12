//
//  ProfileViewModel.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-18.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation
import UIKit

class ProfileViewModel {
	public lazy var userPersonalInfo: UserPersonalInfoModel = UserDefaults.standard.getPersonalInfo()
	public lazy var userLoginInfo: UserLoginInfoModel = UserDefaults.standard.getLoginInfo()
	private static let profile: String = LocalizationKeys.profile.localized()
	private static let password: String = LocalizationKeys.password.localized()
	private static let repeatPassword: String = LocalizationKeys.repeatPassword.localized()
	private static let successfulUpdate: String = LocalizationKeys.successfulUpdateTitle.localized()
	private static let successfulUpdateSubtitle: String = LocalizationKeys.successfulUpdateSubtitle.localized()
	private static let ok: String = LocalizationKeys.ok.localized()
	private static let unsuccessfulUpdate = LocalizationKeys.unsuccessfulUpdateTitle.localized()
	private static let unsuccessfulUpdateMessage = LocalizationKeys.unsuccessfulUpdateSubtitle.localized()
	private static let tryAgain = LocalizationKeys.tryAgain.localized()
	private let inputValidation = InputValidation()
	private let loginService = LoginService()
	
	public var fullName: String {
		return self.userPersonalInfo.name + " " + self.userPersonalInfo.surname
	}
	
	public func checkValidation(email: UITextField, document: UITextField, password: UITextField, repeatPassword: UITextField) -> Bool {
		var isEmailValid = false
		var isDocumentValid = false
		var isPasswordValid = false
		var isRepeatPasswordValid = false
		
        if !self.inputValidation.checkForValidEmailRegularExpression(input: email) {
            self.inputValidation.shakeIfInvalid(textField: email)
        }
        else { isEmailValid = true }
        if !self.inputValidation.checkForValidStringLenght(input: document, lenght: 12) {
            self.inputValidation.shakeIfInvalid(textField: document)
        }
        else { isDocumentValid = true }
		if password.text == nil { isPasswordValid = true } else {
        if !self.inputValidation.checkForValidStringLenght(input: password, lenght: 5) {
            password.text = ""
            self.inputValidation.shakeIfInvalid(textField: password)
        }
		else { isPasswordValid = true }
		}
		if password.text != repeatPassword.text {
			repeatPassword.text = ""
			self.inputValidation.shakeIfInvalid(textField: repeatPassword)
		}
		else { isRepeatPasswordValid = true }
        if isEmailValid && isDocumentValid && isPasswordValid && isRepeatPasswordValid{
            return true
        }
		return false
	}
	
	public func updateToService(document: String?, email: String?, password: String?, completion: @escaping (Bool) -> ()) {
		if let documentNumber = document, let email = email {
			var updateProfileModel: UpdateProfileModel
			if let changedPassword = password {
				updateProfileModel = UpdateProfileModel(documentNumber: documentNumber, email: email, password: changedPassword)}
			else { updateProfileModel = UpdateProfileModel(documentNumber: documentNumber, email: email, password: UserDefaults.standard.getLoginInfo().password) }
			let data = try! JSONEncoder().encode(updateProfileModel)
			
			self.loginService.updateProfile(data: data) {
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
	
	public func updateLocalData(document: String?, email: String?, password: String?) {
		if let documentNumber = document, let emailAddress = email {
			UserDefaults.standard.setDocumentNumber(value: documentNumber)
			UserDefaults.standard.setEmail(value: emailAddress)
		}
		if let changedPassword = password {
			UserDefaults.standard.setPassword(value: changedPassword)
		}
	}
}

extension ProfileViewModel {
	public var profile: String {
		return type(of: self).profile
	}
	
	public var password: String {
		return type(of: self).password
	}
	
	public var repeatPassword: String {
		return type(of: self).repeatPassword
	}
	
	public var successfulUpdate: String {
		return type(of: self).successfulUpdate
	}
	
	public var successfulUpdateSubtitle: String {
		return type(of: self).successfulUpdateSubtitle
	}
	
	public var ok: String {
		return type(of: self).ok
	}
	
	public var unsuccessfulUpdate: String {
		return type(of: self).unsuccessfulUpdate
	}
	
	public var unsuccessfulUpdateMessage: String {
		return type(of: self).unsuccessfulUpdateMessage
	}
	
	public var tryAgain: String {
		return type(of: self).tryAgain
	}
}
