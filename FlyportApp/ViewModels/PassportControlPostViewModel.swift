//
//  PassportControlPostViewModel.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-23.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation

public class PassportControlPostViewModel {
	public var flightInfo: FlightInfoModel
	public var airportPoint: AirportPointModel
	private let airportPointsService: AirportPointService
	private static let yourPassportControlTable: String = LocalizationKeys.yourPassportControlPost.localized()
	private static let navigateToTable = LocalizationKeys.navigateToPassport.localized()
	private static let showQRCode: String = LocalizationKeys.showQR.localized()
	private static let moveToNextProcedure: String = LocalizationKeys.moveToNextProcedure.localized()
	private static let errorTitle: String = LocalizationKeys.error.localized()
	private static let errorSubtitle: String = LocalizationKeys.unsuccessfulUpdateSubtitle.localized()
	private static let ok: String = LocalizationKeys.ok.localized()
	
	public init(point: AirportPointModel, info: FlightInfoModel, service: AirportPointService = AirportPointService()) {
		self.flightInfo = info
		self.airportPoint = point
		self.airportPointsService = service
	}
	
	public func getBoardingGatesInfo(completion: @escaping (AirportPointModel?) -> ()) {
		let userFlightId = UserDefaults.standard.getUserFlightId()
		self.airportPointsService.getBoardingGates(userFlightId: userFlightId) {
			result in
			if let airportPoint = result {
				completion(airportPoint)
			} else {
				completion(nil)
			}
		}
	}
	
	public func completePassportTableVisit(completion: @escaping () -> ()) {
		let userFlightId = UserDefaults.standard.getUserFlightId()
		self.airportPointsService.completePassportPointVisit(userFlightId: userFlightId) {
			_ in
			completion()
		}
	}
}

extension PassportControlPostViewModel {
	public var route: String {
		let fullRoute = self.flightInfo.fromCity + " - " + self.flightInfo.toCity
		return fullRoute
	}
	
	public var flightNumber: String {
		return self.flightInfo.flightNumber
	}
	
	public var yourPassportControlTable: String {
		return type(of: self).yourPassportControlTable
	}
	
	public var tableNumber: String {
		return self.airportPoint.pointNumber
	}
	
	public var navigateToTable: String {
		return type(of: self).navigateToTable
	}
	
	public var showQRCode: String {
		return type(of: self).showQRCode
	}
	
	public var moveToNextProcedure: String {
		return type(of: self).moveToNextProcedure
	}
	
	public var errorTitle: String {
		return type(of: self).errorTitle
	}
	
	public var errorSubtitle: String {
		return type(of: self).errorSubtitle
	}
	
	public var ok: String {
		return type(of: self).ok
	}
}

