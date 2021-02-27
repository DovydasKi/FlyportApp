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
	private let airportPointsService = AirportPointService()
	private static let yourAviationSecurityTable: String = "Your aviation security post:"
	private static let navigateToTable = "Navigate to aviation security point"
	private static let moveToNextProcedure: String = "Move to next procedure"
	private static let errorTitle: String = "Error"
	private static let errorSubtitle: String = "Something went wrong. Try again"
	private static let ok: String = "Ok"
	
	public init(point: AirportPointModel, info: FlightInfoModel) {
		self.flightInfo = info
		self.airportPoint = point
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
