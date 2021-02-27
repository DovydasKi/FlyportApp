//
//  QRCodeViewModel.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-23.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation

public class QRCodeViewModel {
	private static let yourCodeTitle: String = "Your QR code"
	private static let hideCodeTitle: String = "Hide QR code"
	private let flightNumber: String
	private let routeFrom: String
	private let routeTo: String
	
	public init(flightNumber: String, route: String) {
		self.flightNumber = flightNumber
		let routeFull = route.split(separator: "-")
		self.routeFrom = String(routeFull[0])
		self.routeTo = String(routeFull[1])
	}
	
	public func getRegistrationTableQRDate() -> Data {
		let personalData = UserDefaults.standard.getPersonalInfo()
		let pointCodeData = RegistrationPointQRCodeData(name: personalData.name, surname: personalData.surname, passportNumber: personalData.documentNumber, personalCode: personalData.personalCode, flightNumber: self.flightNumber, flightfrom: self.routeFrom, flightTo: self.routeTo)
		let data = try! JSONEncoder().encode(pointCodeData)
		return data
	}
}

extension QRCodeViewModel {
	public var yourCodeTitle: String {
		return type(of: self).yourCodeTitle
	}
	
	public var hideCodeTitle: String {
		return type(of: self).hideCodeTitle
	}
}
