//
//  FlightAirportPointModel.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-17.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation

public class FlightAirportPointModel: Decodable {
	public var pointNumber: String
	public var type: String
	
	public init(pointNumber: String, type: String) {
		self.pointNumber = pointNumber
		self.type = type
	}
}
