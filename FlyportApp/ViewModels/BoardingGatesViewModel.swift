//
//  BoardingGatesViewModel.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-23.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation

public class BoardingGatesViewModel {
	public var flightInfo: FlightInfoModel
	public var airportPoint: AirportPointModel
	private let airportPointsService = AirportPointService()
	private static let yourBoardingGates: String = "Your boarding gates:"
	private static let navigateToTable = "Navigate to boarding gates"
	private static let finish: String = "Finish"
	private static let errorTitle: String = "Error"
	private static let errorSubtitle: String = "Something went wrong. Try again"
	private static let ok: String = "Ok"
	
	public init(point: AirportPointModel, info: FlightInfoModel) {
		self.flightInfo = info
		self.airportPoint = point
	}
}

extension BoardingGatesViewModel {
	public var route: String {
		let fullRoute = self.flightInfo.fromCity + " - " + self.flightInfo.toCity
		return fullRoute
	}
	
	public var flightNumber: String {
		return self.flightInfo.flightNumber
	}
	
	public var yourBoardingGates: String {
		return type(of: self).yourBoardingGates
	}
	
	public var tableNumber: String {
		return self.airportPoint.pointNumber
	}
	
	public var navigateToTable: String {
		return type(of: self).navigateToTable
	}
	
	public var finish: String {
		return type(of: self).finish
	}
	
	public var errorTitle: String {
		return type(of: self).errorTitle
	}
	
	public var errorSubtitle: String {
		return type(of: self).errorSubtitle
	}
	
	public var ok: String {
		return type(of: self).ok
	}
}
