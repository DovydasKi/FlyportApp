//
//  RegistrationRequestModel.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-04.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation

public struct RegistrationRequestModel: Codable {
	public let email: String
	public let password: String
	public let name: String
	public let surname: String
	public let personalCode: String
	public let documentNumber: String
	
	public init (email: String, password: String, name: String, surname: String, personalCode: String, documentNumber: String) {
		self.email = email
		self.password = password
		self.name = name
		self.surname = surname
		self.personalCode = personalCode
		self.documentNumber = documentNumber
	}
}
