//
//  RegisteredLuggageViewModel.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-23.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation

public class RegisteredLuggageViewModel {
	private let airportPointsService = AirportPointService()
	public var flightInfo: FlightInfoModel
	private static let luggageQuestion: String = LocalizationKeys.luggageQuestion.localized()
	private static let errorTitle: String = LocalizationKeys.error.localized()
	private static let errorSubtitle: String = LocalizationKeys.unsuccessfulUpdateSubtitle.localized()
	private static let ok: String = LocalizationKeys.ok.localized()
	
	public init(flightInfo: FlightInfoModel) {
		self.flightInfo = flightInfo
	}
	
	public func getRegistrationPointInfo(completion: @escaping (AirportPointModel?) -> ()) {
		let userFlightId = UserDefaults.standard.getUserFlightId()
		self.airportPointsService.getRegistrationPoint(userFlightId: userFlightId) {
			result in
			if let airportPoint = result {
				completion(airportPoint)
			} else {
				completion(nil)
			}
		}
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
}

extension RegisteredLuggageViewModel {
	public var luggageQuestion: String {
		return type(of: self).luggageQuestion
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
