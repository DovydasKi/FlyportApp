//
//  MyFlightsViewModel.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-10.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation

class MyFlightsViewModel {
	private static let myFlights = "My flights"
	private static let newFlight = "New flight"
}

extension MyFlightsViewModel {
	public var myFlights: String {
		type(of: self).myFlights
	}
	
	public var newFlight: String {
		type(of: self).newFlight
	}
}
