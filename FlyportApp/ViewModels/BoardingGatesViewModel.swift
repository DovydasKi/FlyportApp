//
//  BoardingGatesViewModel.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-23.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation

public class BoardingGatesViewModel {
	private static let route: String = "Vilnius(VNO) - Enfidha(NBE)"
	private static let flightNumber: String = "GW3352"
	private static let yourBoardingGates: String = "Your boarding gates:"
	private static let tableNumber: String = "12A"
	private static let navigateToTable = "Navigate to boarding gates"
	private static let finish: String = "Finish"
}

extension BoardingGatesViewModel {
	public var route: String {
		return type(of: self).route
	}
	
	public var flightNumber: String {
		return type(of: self).flightNumber
	}
	
	public var yourBoardingGates: String {
		return type(of: self).yourBoardingGates
	}
	
	public var tableNumber: String {
		return type(of: self).tableNumber
	}
	
	public var navigateToTable: String {
		return type(of: self).navigateToTable
	}
	
	public var finish: String {
		return type(of: self).finish
	}
}
