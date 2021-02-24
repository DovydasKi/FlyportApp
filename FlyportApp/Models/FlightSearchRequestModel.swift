//
//  FlightSearchRequestModel.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-24.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation

public struct FlightSearchRequestModel: Codable {
	public var flightNumber: String
	public var flightDate: Date
	
	public init(flightNumber: String, flightDate: String) {
		self.flightNumber = flightNumber
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd"
		self.flightDate = dateFormatter.date(from: flightDate)!
	}
}
