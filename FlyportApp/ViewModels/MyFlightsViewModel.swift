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
	private let userFlightsService = UserFlightsService()
	public var isFlightsEmpty: Bool = true
	
	public func getFlightsData(completion: @escaping (UserFlightsModel?) -> ()) {
		self.userFlightsService.getUserFlightsData() {
			result in
			if let userFlights = result {
				completion(userFlights)
			} else {
				completion(nil)
			}
		}
	}
}

extension MyFlightsViewModel {
	public var myFlights: String {
		type(of: self).myFlights
	}
	
	public var newFlight: String {
		type(of: self).newFlight
	}
}
