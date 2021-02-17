//
//  FlightAirportPointsViewModel.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-17.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation
import UIKit

public class FlightAirportPointsViewModel {
	public let airlinesImage: UIImage
	public let route: String
	public let flightNumber: String
	public let flightId: Int
	private static let registrationTableTitle: String = "Registration Table"
	private static let aviationSecurityPostTitle: String = "Aviation security post"
	private static let passportControlPostTitle: String = "Passport control post"
	private static let boardingGatesTitle: String = "Boarding gates"
	private static let registrationTableImage: String = "Registration"
	private static let aviationSecurityPostImage: String = "SecurityPoint"
	private static let passportControlPostImage: String = "PassportControl"
	private static let boardingGatesImage: String = "BoardingGates"
	private let userFlightsService = UserFlightsService()
	
	public init(flightId: Int, image: UIImage, route: String, flightNumber: String) {
		self.flightId = flightId
		self.airlinesImage = image
		self.route = route
		self.flightNumber = flightNumber
	}
	
	public func getFlightsData(completion: @escaping (FlightAirportPointsModel?) -> ()) {
		self.userFlightsService.getAirportPointsData(flightId: flightId, completion: {
			result in
			if let flightPoints = result {
				completion(flightPoints)
			} else {
				completion(nil)
			}
		})
	}
}

extension FlightAirportPointsViewModel {
	public var registrationTableTitle: String {
		return type(of: self).registrationTableTitle
	}
	
	public var aviationSecurityPostTitle: String {
		return type(of: self).aviationSecurityPostTitle
	}
	
	public var passportControlPostTitle: String {
		return type(of: self).passportControlPostTitle
	}

	public var boardingGatesTitle: String {
		return type(of: self).boardingGatesTitle
	}
	
	public var registrationTableImage: String {
		return type(of: self).registrationTableImage
	}
	
	public var aviationSecurityPostImage: String {
		return type(of: self).aviationSecurityPostImage
	}
	
	public var passportControlPostImage: String {
		return type(of: self).passportControlPostImage
	}
	
	public var boardingGatesImage: String {
		return type(of: self).boardingGatesImage
	}
}
