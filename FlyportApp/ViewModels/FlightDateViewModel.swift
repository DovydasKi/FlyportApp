//
//  FlighDateViewModel.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-22.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation
import UIKit

public class FlightDateViewModel {
	private var flightNumber: String
	private static let enterDate: String = "Enter your flight date"
	private static let flightDatePlaceholder: String = "Flight date"
	private static let select: String = "Select"
	private static let errorTitle: String = "Error"
	private static let errorSubtitle: String = "It seems that flight which you entered does'nt exist. Try edit flight information"
	private static let ok: String = "Ok"
	private var inputValidation = InputValidation()
	private let userFlightsService = UserFlightsService()
	
	public init(flightNumber: String) {
		self.flightNumber = flightNumber
	}
	
	public func getFlightNumber() -> String {
		return self.flightNumber
	}
	
	public func checkValidDate(dateTextField: UITextField) -> Bool {
		if !self.inputValidation.checkForValidDate(input: dateTextField) {
			self.inputValidation.shakeIfInvalid(textField: dateTextField)
			return false
		} else { return true }
	}
	
	public func searchFlight(date: String, completion: @escaping (FlightInfoModel?) -> ()) {
		let requestModel = FlightSearchRequestModel(flightNumber: self.flightNumber, flightDate: date)
		let data = try! JSONEncoder().encode(requestModel)
		self.userFlightsService.flightsSearch(data: data) {
			result in
			if let flight = result {
				completion(flight)
			} else {
				completion(nil)
			}
		}
	}
}

extension FlightDateViewModel {
	public var enterDate: String {
		return type(of: self).enterDate
	}
	
	public var flightDatePlaceholder: String {
		return type(of: self).flightDatePlaceholder
	}
	
	public var select: String {
		return type(of: self).select
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
