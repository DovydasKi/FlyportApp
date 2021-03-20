//
//  AviationSecurityViewModel.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-23.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation

public class AviationSecurityViewModel {
	public var flightInfo: FlightInfoModel
	public var airportPoint: AirportPointModel
	private let airportPointsService: AirportPointService
	private static let yourAviationSecurityTable: String = LocalizationKeys.yourAviationSecurityPost.localized()
	private static let navigateToTable = LocalizationKeys.navigateToSecurity.localized()
	private static let moveToNextProcedure: String = LocalizationKeys.moveToNextProcedure.localized()
	private static let errorTitle: String = LocalizationKeys.error.localized()
	private static let errorSubtitle: String = LocalizationKeys.unsuccessfulUpdateSubtitle.localized()
	private static let ok: String = LocalizationKeys.ok.localized()
	
	public init(point: AirportPointModel, info: FlightInfoModel, service: AirportPointService = AirportPointService()) {
		self.flightInfo = info
		self.airportPoint = point
		self.airportPointsService = service
	}
	
	public func getPassportPointInfo(completion: @escaping (AirportPointModel?) -> ()) {
		let userFlightId = UserDefaults.standard.getUserFlightId()
		self.airportPointsService.getPassportPoint(userFlightId: userFlightId) {
			result in
			if let airportPoint = result {
				completion(airportPoint)
			} else {
				completion(nil)
			}
		}
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
	
	public func completeAviationSecurityTableVisit(completion: @escaping () -> ()) {
		let userFlightId = UserDefaults.standard.getUserFlightId()
		self.airportPointsService.completeSecurityPointVisit(userFlightId: userFlightId) {
			_ in
			completion()
		}
	}
}

extension AviationSecurityViewModel {
	public var route: String {
		let fullRoute = self.flightInfo.fromCity + " - " + self.flightInfo.toCity
		return fullRoute
	}
	
	public var flightNumber: String {
		return self.flightInfo.flightNumber
	}
	
	public var yourAviationSecurityTable: String {
		return type(of: self).yourAviationSecurityTable
	}
	
	public var tableNumber: String {
		return self.airportPoint.pointNumber
	}
	
	public var navigateToTable: String {
		return type(of: self).navigateToTable
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
