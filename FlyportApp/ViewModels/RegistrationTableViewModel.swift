//
//  RegistrationTableViewModel.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-23.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation

public class RegistrationTableViewModel {
	private let airportPoint: AirportPointModel
	public let flightInfo: FlightInfoModel
	private let airportPointsService = AirportPointService()
	private static let yourRegistrationTable: String = "Your registration table:"
	private static let navigateToTable = "Navigate to registration table"
	private static let showQRCode: String = "Show my QR code"
	private static let moveToNextProcedure: String = "Move to next procedure"
	private static let errorTitle: String = "Error"
	private static let errorSubtitle: String = "Something went wrong. Try again"
	private static let ok: String = "Ok"
	
	public init(point: AirportPointModel, info: FlightInfoModel) {
		self.flightInfo = info
		self.airportPoint = point
	}
	
	public func getSecurityPointInfo(completion: @escaping (AirportPointModel?) -> ()) {
		let userFlightId = UserDefaults.standard.getUserFlightId()
		self.airportPointsService.getSecurityPoint(userFlightId: userFlightId) {
			result in
			if let airportPoint = result {
				completion(airportPoint)
			} else {
				completion(nil)
			}
		}
	}
	
	public func completeRegistrationTableVisit(completion: @escaping () -> ()) {
		let userFlightId = UserDefaults.standard.getUserFlightId()
		self.airportPointsService.completeRegistrationPointVisit(userFlightId: userFlightId) {
			_ in 
			completion()
		}
	}
}

extension RegistrationTableViewModel {
	public var route: String {
		let fullRoute = self.flightInfo.fromCity + " - " + self.flightInfo.toCity
		return fullRoute
	}
	
	public var flightNumber: String {
		return self.flightInfo.flightNumber
	}
	
	public var yourRegistrationTable: String {
		return type(of: self).yourRegistrationTable
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
	
	public func getRegistrationPoint() -> AirportPointModel {
		return self.airportPoint
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
