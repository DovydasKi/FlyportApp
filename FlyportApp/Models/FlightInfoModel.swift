//
//  FlightInfoModel.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-24.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation

public struct FlightInfoModel: Decodable {
	public let flightId: Int
	public let flightNumber: String
	public let flightDate: String
	public let airlines: String
	public let fromCity: String
	public let toCity: String
	public let passportControl: Bool
	
	public init(flightId: Int, flightNumber: String, flightDate: String, airlines: String, fromCity: String, toCity: String, passportControl: Bool) {
		self.flightId = flightId
		self.flightNumber = flightNumber
		self.flightDate = flightDate
		self.airlines = airlines
		self.fromCity = fromCity
		self.toCity = toCity
		self.passportControl = passportControl
	}
}
