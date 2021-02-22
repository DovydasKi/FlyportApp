//
//  FlighDateViewModel.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-22.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation

public class FlightDateViewModel {
	private var flightNumber: String
	private static let enterDate: String = "Enter your flight date"
	private static let flightDatePlaceholder: String = "Flight date"
	private static let select: String = "Select"
	
	public init(flightNumber: String) {
		self.flightNumber = flightNumber
	}
	
	public func getFlightNumber() -> String {
		return self.flightNumber
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
}
