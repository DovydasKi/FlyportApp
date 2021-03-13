//
//  SelectedFlightViewModel.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-25.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation

public class SelectedFlightViewModel {
	private let userFlightsService = UserFlightsService()
	private var flightInfo: FlightInfoModel
	private static let yourFlightTitle: String = LocalizationKeys.yourSelectedFlight.localized()
	private var route: String
	private var flightDate: String
	private static let errorTitle: String = LocalizationKeys.error.localized()
	private static let errorSubtitle: String = LocalizationKeys.unsuccessfulUpdateSubtitle.localized()
	private static let ok: String = LocalizationKeys.ok.localized()
	
	public init(flightInfo: FlightInfoModel) {
		self.flightInfo = flightInfo
		self.route = flightInfo.fromCity + " - " + flightInfo.toCity
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd"
		self.flightDate = flightInfo.flightDate
	}
	
	public func getFlightInfo() -> FlightInfoModel {
		return self.flightInfo
	}
	
	public func registerFlight(completion: @escaping (Bool) -> ()) {
		let creationRequestModel = UserFlightCreationModel(userId: UserDefaults.standard.getUserId(), flightId: self.flightInfo.flightId)
			let data = try! JSONEncoder().encode(creationRequestModel)
			
			self.userFlightsService.registerUserFlight(data: data) {
				result in
				if let id = result?.userFlightId {
					UserDefaults.standard.setUserFlightId(value: id)
					completion(true)
				} else {
					completion(false)
				}
			}
	}
}

extension SelectedFlightViewModel {
	public var youtFlightTitle: String {
		return type(of: self).yourFlightTitle
	}
	
	public var fullRoute: String {
		return self.route
	}
	
	public var date: String {
		return self.flightDate
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
