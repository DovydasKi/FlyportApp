//
//  FlightAirportPointsModel.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-17.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation

public class FlightAirportPointsModel: Decodable {
	public var registrationPoint: FlightAirportPointModel?
	public var securityPoint: FlightAirportPointModel?
	public var passportPoint: FlightAirportPointModel?
	public var boardingGates: FlightAirportPointModel?
	
	public init(registrationPoint: FlightAirportPointModel?, securityPoint: FlightAirportPointModel?, passportPoint: FlightAirportPointModel?, boardingGates: FlightAirportPointModel?) {
		self.registrationPoint = registrationPoint
		self.securityPoint = securityPoint
		self.passportPoint = passportPoint
		self.boardingGates = boardingGates
	}
}
