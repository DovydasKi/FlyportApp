//
//  FlightNumberViewModel.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-22.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation

public class FlightNumberViewModel {
	private static let enterNumber: String = "Enter your flight number"
	private static let flightNumberPlaceholder: String = "Flight number"
}

extension FlightNumberViewModel {
	public var enterNumber: String {
		return type(of: self).enterNumber
	}
	
	public var flightNumberPlaceholder: String {
		return type(of: self).flightNumberPlaceholder
	}
}
