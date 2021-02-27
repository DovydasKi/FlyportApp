//
//  RegistrationPointQRCodeData.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-27.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation


public struct RegistrationPointQRCodeData: Codable {
	public let name: String
	public let surname: String
	public let passportNumber: String
	public let personalCode: String
	public let flightNumber: String
	public let flightfrom: String
	public let flightTo: String
	
	public init(name: String, surname: String, passportNumber: String, personalCode: String, flightNumber: String, flightfrom: String, flightTo: String) {
		self.name = name
		self.surname = surname
		self.passportNumber = passportNumber
		self.personalCode = personalCode
		self.flightNumber = flightNumber
		self.flightfrom = flightfrom
		self.flightTo = flightTo
	}
}
