//
//  UserFlightModel.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-09.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation

public struct UserFlightModel: Decodable {
	public var userFlightId: Int
	public var completed: Bool
	public var flightId: Int
	public var flightNumber: String
	public var flightDate: String
	public var airlines: String
	public var fromCity: String
	public var toCity: String
	
	public init(userFlightId: Int, completed: Bool, flightId: Int, flightNumber: String, flightDate: String, airlines: String, fromCity: String, toCity: String) {
		self.userFlightId = userFlightId
		self.completed = completed
		self.flightId = flightId
		self.flightNumber = flightNumber
		self.flightDate = flightDate
		self.airlines = airlines
		self.fromCity = fromCity
		self.toCity = toCity
	}
}
