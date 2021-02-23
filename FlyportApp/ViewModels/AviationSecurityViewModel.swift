//
//  AviationSecurityViewModel.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-23.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation

public class AviationSecurityViewModel {
	private static let route: String = "Vilnius(VNO) - Enfidha(NBE)"
	private static let flightNumber: String = "GW3352"
	private static let yourAviationSecurityTable: String = "Your aviation security post:"
	private static let tableNumber: String = "12A"
	private static let navigateToTable = "Navigate to aviation security point"
	private static let moveToNextProcedure: String = "Move to next procedure"
}

extension AviationSecurityViewModel {
	public var route: String {
		return type(of: self).route
	}
	
	public var flightNumber: String {
		return type(of: self).flightNumber
	}
	
	public var yourAviationSecurityTable: String {
		return type(of: self).yourAviationSecurityTable
	}
	
	public var tableNumber: String {
		return type(of: self).tableNumber
	}
	
	public var navigateToTable: String {
		return type(of: self).navigateToTable
	}
	
	public var moveToNextProcedure: String {
		return type(of: self).moveToNextProcedure
	}
}
