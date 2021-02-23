//
//  RegistrationTableViewModel.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-23.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation

public class RegistrationTableViewModel {
	private static let route: String = "Vilnius(VNO) - Enfidha(NBE)"
	private static let flightNumber: String = "GW3352"
	private static let yourRegistrationTable: String = "Your registration table:"
	private static let tableNumber: String = "23"
	private static let navigateToTable = "Navigate to registration table"
	private static let showQRCode: String = "Show my QR code"
	private static let moveToNextProcedure: String = "Move to next procedure"
}

extension RegistrationTableViewModel {
	public var route: String {
		return type(of: self).route
	}
	
	public var flightNumber: String {
		return type(of: self).flightNumber
	}
	
	public var yourRegistrationTable: String {
		return type(of: self).yourRegistrationTable
	}
	
	public var tableNumber: String {
		return type(of: self).tableNumber
	}
	
	public var navigateToTable: String {
		return type(of: self).navigateToTable
	}
	
	public var showQRCode: String {
		return type(of: self).showQRCode
	}
	
	public var moveToNextProcedure: String {
		return type(of: self).moveToNextProcedure
	}
}
