//
//  PassportControlPostViewModel.swift
//  FlyportApp
//
//  Created by Dovydas Kiriliauskas on 2021-02-23.
//  Copyright © 2021 Dovydas Kiriliauskas. All rights reserved.
//

import Foundation

public class PassportControlPostViewModel {
	private static let route: String = "Vilnius(VNO) - Enfidha(NBE)"
	private static let flightNumber: String = "GW3352"
	private static let yourPassportControlTable: String = "Your passport control post:"
	private static let tableNumber: String = "322"
	private static let navigateToTable = "Navigate to passport control post"
	private static let showQRCode: String = "Show my QR code"
	private static let moveToNextProcedure: String = "Move to next procedure"
}

extension PassportControlPostViewModel {
	public var route: String {
		return type(of: self).route
	}
	
	public var flightNumber: String {
		return type(of: self).flightNumber
	}
	
	public var yourPassportControlTable: String {
		return type(of: self).yourPassportControlTable
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

