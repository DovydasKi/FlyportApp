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
	
	func getLoginInfo() -> UserLoginInfoModel {
		let email = string(forKey: UserDefaultKeys.email.rawValue)
		let password = string(forKey: UserDefaultKeys.password.rawValue)
		return UserLoginInfoModel(email: email!, password: password!)
	}
	
	func getPersonalInfo() -> UserPersonalInfoModel {
		let name = string(forKey: UserDefaultKeys.name.rawValue)
		let surname = string(forKey: UserDefaultKeys.surname.rawValue)
		let personalCode = string(forKey: UserDefaultKeys.personalCode.rawValue)
		let documentNumber = string(forKey: UserDefaultKeys.documentNumber.rawValue)
		return UserPersonalInfoModel(name: name!, surname: surname!, personalCode: personalCode!, documentNumber: documentNumber!)
	}
	
	func setLoginInfo(value: UserLoginInfoModel) {
		set(value.email, forKey: UserDefaultKeys.email.rawValue)
		set(value.password, forKey: UserDefaultKeys.password.rawValue)
	}
	
	func setPersonalInfo(value: UserPersonalInfoModel) {
		set(value.name, forKey: UserDefaultKeys.name.rawValue)
		set(value.surname, forKey: UserDefaultKeys.surname.rawValue)
		set(value.personalCode, forKey: UserDefaultKeys.personalCode.rawValue)
		set(value.documentNumber, forKey: UserDefaultKeys.documentNumber.rawValue)
	}
	
	func setEmail(value: String) {
		set(value, forKey: UserDefaultKeys.email.rawValue)
	}
	
	func setPassword(value: String) {
		set(value, forKey: UserDefaultKeys.password.rawValue)
	}
	
	func setDocumentNumber(value: String) {
		set(value, forKey: UserDefaultKeys.documentNumber.rawValue)
	}
	
	func getUserFlightId() -> Int {
		return integer(forKey: UserDefaultKeys.userFlightId.rawValue)
	}
	
	func setUserFlightId(value: Int) {
		set(value, forKey: UserDefaultKeys.userFlightId.rawValue)
	}
}
