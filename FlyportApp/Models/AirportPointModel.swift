//
//  AirportPointModel.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-24.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation


public struct AirportPointModel: Decodable {
	public let airportPointId: Int
	public let type: String
	public let pointNumber: String
	
	public init(airportPointId: Int, type: String, pointNumber: String) {
		self.airportPointId = airportPointId
		self.type = type
		self.pointNumber = pointNumber
	}
}
